local M = {}

local function pick_symbol()
    local symbols = require("wims.symbols.symbol_list")
	local choice = MiniPick.start({ source = { items = symbols } })
    if not choice then return end
	local character = string.gsub(choice, "\t.*", "")
    return character
end

function M.insert_symbol()
    local character = pick_symbol()
    if character ~= nil then
        local pos = vim.api.nvim_win_get_cursor(0)[2]
        local c_line = vim.api.nvim_get_current_line()
        local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
        vim.api.nvim_set_current_line(n_line)
    end
end

function M.yank_symbol()
    local character = pick_symbol()
    if character ~= nil then
        vim.fn.setreg('"', character)
    end
end

return M
