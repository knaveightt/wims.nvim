local M = {}

local MiniPick = require("mini.pick")

function M.pick_symbol(action)
    local character
    local symbols = require("wims.symbols.symbol_list")
    local choice = MiniPick.start({ source = { items = symbols } })
    if choice then
        character = string.gsub(choice, "\t.*", "")
    end

    if action == "insert" then
        require("wims.actions").insert_symbol(character)
    elseif action == "yank" then
        require("wims.actions").yank_symbol(character)
    end
end

return M
