local M = {}

function M.insert_symbol(character)
    if character ~= nil then
        local pos = vim.api.nvim_win_get_cursor(0)[2]
        local c_line = vim.api.nvim_get_current_line()
        local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
        vim.api.nvim_set_current_line(n_line)
    end
end

function M.yank_symbol(character)
    if character ~= nil then
        vim.fn.setreg('"', character)
    end
end

return M
