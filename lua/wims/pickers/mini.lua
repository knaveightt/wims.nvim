local M = {}

function pick_symbol()
    local symbols = require("wims.symbols.symbol_list")
	local choice = MiniPick.start({ source = { items = symbols } })
	local character = string.gsub(choice, "\t.*", "")
    return character
end

function M.insert_symbol()
    local character = pick_symbol()
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local c_line = vim.api.nvim_get_current_line()
	local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
	vim.api.nvim_set_current_line(n_line)
end

function M.yank_symbol()
    local character = pick_symbol()
    vim.fn.setreg('"', character)
end

return M
