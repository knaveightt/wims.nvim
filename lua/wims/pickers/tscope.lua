local M = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

function M.pick_symbol(action)
    local opts = {}
    local character
    local symbols = require("wims.symbols.symbol_list")

    local choice
    pickers.new(opts, {
        prompt_title = "Symbols",
        finder = finders.new_table {
            results = symbols
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                choice = selection[1]
                character = string.gsub(choice, "\t.*", "")

                if action == "insert" then
                    require("wims").insert_symbol_now(character)
                elseif action == "yank" then
                    require("wims").yank_symbol_now(character)
                end
            end)
            return true
        end,
    }):find()
end

return M
