local M = {}

local MiniPick = require("mini.pick")

function M.pick_symbol(action)
    local character
    if action == "insert" or action == "yank" then 
        local symbols = require("wims.symbols.symbol_list")
        local choice = MiniPick.start({ source = { items = symbols } })
        if choice then
            character = string.gsub(choice, "\t.*", "")
        end
    end
    return character
end

return M
