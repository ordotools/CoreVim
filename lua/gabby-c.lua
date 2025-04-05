
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gabc",
  callback = function()
    vim.bo.filetype = "gabc"
  end,
})

local M = {}

-- UTF-8 safe character iterator
local function utf8_chars(str)
  local i = 1
  return function()
    if i > #str then return nil end
    local c = string.byte(str, i)
    local len = 1
    if c >= 0xF0 then len = 4
    elseif c >= 0xE0 then len = 3
    elseif c >= 0xC0 then len = 2 end
    local char = str:sub(i, i + len - 1)
    i = i + len
    return char
  end
end

-- Vowels including Latin accented vowels
local function is_vowel(c)
  return c:lower():match("[aeiouyáéíóúýàèìòùâêîôûäëïöüãõāēīōūæœ]") ~= nil
end

-- Only treat AE, OE, AU as true diphthongs
local DIPHTHONGS = {
  ["ae"] = true, ["au"] = true, ["oe"] = true,
  ["AE"] = true, ["AU"] = true, ["OE"] = true
}

-- Clusters that should not be split
local UNSPLITTABLE_CLUSTERS = {
  ["bl"] = true, ["br"] = true, ["cl"] = true, ["cr"] = true,
  ["dr"] = true, ["fl"] = true, ["fr"] = true, ["gl"] = true,
  ["gr"] = true, ["pl"] = true, ["pr"] = true, ["tr"] = true,
  ["ph"] = true, ["th"] = true, ["qu"] = true, ["gn"] = true
}

-- Proper syllabification
function M.syllabify_latin_word(word, is_last_word)
  local base, punct = word:match("^(.-)([%.,:;!%?]*)$")
  local chars = {}
  for c in utf8_chars(base) do table.insert(chars, c) end

  local i = 1
  local syllables = {}
  local current = ""

  while i <= #chars do
    local c = chars[i]
    local next1 = chars[i+1]
    local next2 = chars[i+2]
    local pair = (c or "") .. (next1 or "")

    current = current .. c

    if DIPHTHONGS[pair:lower()] then
      current = current .. next1
      i = i + 2
    elseif is_vowel(c) then
      local j = i + 1
      local consonants = {}
      while j <= #chars and not is_vowel(chars[j]) do
        table.insert(consonants, chars[j])
        j = j + 1
      end

      if #consonants == 0 then
        table.insert(syllables, current)
        current = ""
        i = i + 1
      elseif #consonants == 1 and j <= #chars then
        table.insert(syllables, current)
        current = ""
        i = i + 1
      elseif UNSPLITTABLE_CLUSTERS[(consonants[1] or "") .. (consonants[2] or "")] then
        table.insert(syllables, current)
        current = ""
        i = i + 1
      elseif j > #chars then
        current = current .. table.concat(consonants)
        table.insert(syllables, current)
        current = ""
        break
      else
        current = current .. consonants[1]
        table.insert(syllables, current)
        current = ""
        i = i + #consonants
      end
    else
      i = i + 1
    end
  end

  if current ~= "" then
    table.insert(syllables, current)
  end

  local output
  if #syllables == 1 then
    output = base .. "()"
  else
    output = table.concat(syllables, "()") .. "()"
  end

  -- Handle punctuation additions
  if punct == "." then
    output = output .. ".()" .. (is_last_word and " (::z)" or " (::)")
  elseif punct == ":" or punct == ";" then
    output = output .. " :(:)"
  elseif punct == "," then
    output = output .. ",() (;)"
  end

  return output
end

function M.syllabify_visual()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  local new_lines = {}

  for i, line in ipairs(lines) do
    local words = {}
    for word in line:gmatch("%S+") do
      table.insert(words, word)
    end
    local processed = {}
    for j, word in ipairs(words) do
      local is_last = (i == #lines and j == #words)
      table.insert(processed, M.syllabify_latin_word(word, is_last))
    end
    new_lines[i] = table.concat(processed, " ")
  end

  vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, end_pos[2], false, new_lines)
end

vim.api.nvim_set_keymap('v', 'gs', [[:lua require'gabby-c'.syllabify_visual()<CR>]], { noremap = true, silent = true })

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "gabc",
    callback = function()
      vim.keymap.set("i", "<space>", function()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()

        local before = line:sub(1, col)
        local after = line:sub(col + 1)

        -- Check if cursor is inside a pair of parentheses
        local open_pos = before:find("[(][^)]*$")
        local close_pos = after:find("^[^)]*[)]")

        local in_parens = open_pos and close_pos

        if in_parens then
          -- Search for next set of parentheses after the current cursor
          local next_start, next_end = after:find("%b()")
          if next_start then
            -- Move cursor inside the next ()
            vim.api.nvim_win_set_cursor(0, { row, col + next_start })
            return
          else
            vim.api.nvim_echo({{"[gabby-c] No further parentheses found.", "WarningMsg"}}, false, {})
            return
          end
        end

        -- Not in parentheses: insert a space
        vim.api.nvim_feedkeys(" ", "n", false)
      end, { buffer = true })
    end,
  })
end

return M

