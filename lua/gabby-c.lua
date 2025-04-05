
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
    output = table.concat(syllables, "()")
  end

  -- Handle punctuation additions
  if punct == "." then
    output = output .. ".()" .. (is_last_word and " (::z)" or " (::)")
  elseif punct == ":" or punct == ";" then
    output = output .. " :(:)"
  elseif punct == "," then
    output = output .. ",() (;)"
  else
    output = output .. "()"
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

----------------------------------
function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "gabc",
    callback = function()
      local function jump_parens(direction)
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line_count = vim.api.nvim_buf_line_count(0)

        local start_line = row
        local line_step = direction == "forward" and 1 or -1

        for i = 0, line_count do
          local lnum = start_line + i * line_step
          if lnum < 1 or lnum > line_count then break end

          local text = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
          local search_start = (lnum == row and direction == "forward") and col + 2 or 1
          local search_end = (lnum == row and direction == "backward") and col or #text

          if direction == "forward" then
            local s, e = text:find("%b()", search_start)
            if s and e then
              vim.api.nvim_win_set_cursor(0, { lnum, s })
              return true
            end
          else
            -- backward: find all matches and go to the last one before cursor
            local last_s
            local i = 1
            while true do
              local s, e = text:find("%b()", i)
              if not s or s >= search_end then break end
              last_s = s
              i = e + 1
            end
            if last_s then
              vim.api.nvim_win_set_cursor(0, { lnum, last_s })
              return true
            end
          end
        end

        vim.api.nvim_echo({ { "[gabby-c] No matching parentheses found.", "WarningMsg" } }, false, {})
        return false
      end

      -- <Space>: jump forward if inside parens
      vim.keymap.set("i", "<Space>", function()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()
        local before = line:sub(1, col)
        local after = line:sub(col + 1)

        local open = before:match("[(][^)]*$")
        local close = after:match("^[^)]*[)]")

        if open and close then
          if jump_parens("forward") then return end
        end

        -- default: insert space
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(" ", true, false, true), "i", false)
      end, { buffer = true })

      -- <M-Space>: jump backward
      vim.keymap.set("i", "<M-Space>", function()
        jump_parens("backward")
      end, { buffer = true })
    end,
  })
end

return M

