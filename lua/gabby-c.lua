vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.gabc",
	callback = function()
		vim.bo.filetype = "gabc"
	end,
})

local M = {}

----------------------------------------------------------
-------  Add () behind each vowel in visual mode  --------
----------------------------------------------------------

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

local function is_vowel(c)
	return c:lower():match("[aeiouyáéíóúýàèìòùâêîôûäëïöüãõāēīōūæœ]") ~= nil
end

local DIPHTHONGS = {
	["ae"] = true, ["au"] = true, ["oe"] = true,
	["AE"] = true, ["AU"] = true, ["OE"] = true
}

function M.syllabify_latin_word(word, is_last_word)
	local base, punct = word:match("^(.-)([%.,:;!%?]*)$")
	local chars = {}
	for c in utf8_chars(base) do table.insert(chars, c) end

	local i = 1
	local result = {}

	while i <= #chars do
		local c = chars[i]
		local next1 = chars[i + 1] or ""
		local pair = c .. next1

		if DIPHTHONGS[pair:lower()] then
			table.insert(result, pair .. "()")
			i = i + 2
		elseif is_vowel(c) then
			table.insert(result, c .. "()")
			i = i + 1
		else
			table.insert(result, c)
			i = i + 1
		end
	end

	local output = table.concat(result)

	if punct ~= "" then
		output = output .. punct
	end

	if punct == "." then
		output = output .. (is_last_word and " (::z)" or " (::)")
	elseif punct == ":" or punct == ";" then
		output = output .. " :(:)"
	elseif punct == "," then
		output = output .. " (;)"
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

----------------------------------------------------------
-------------  Jump to the next () with Tab  -------------
----------------------------------------------------------

local function jump_to_next_pair()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line_count = vim.api.nvim_buf_line_count(0)
	for lnum = row, line_count do
		local line_text = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
		local search_start = (lnum == row) and (col + 1) or 1
		local s, e = line_text:find("%b()", search_start)
		if s then
			vim.api.nvim_win_set_cursor(0, { lnum, s })
			return true
		end
	end
	return false
end

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "gabc",
		callback = function()
			vim.keymap.set({ "n", "i", "v" }, "<Tab>", function()
				if not jump_to_next_pair() then
					vim.api.nvim_echo({ { "[gabby-c] No next parentheses found.", "WarningMsg" } }, false, {})
				end
			end, { buffer = true, noremap = true })
		end,
	})
end

return M

