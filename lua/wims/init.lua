local M = {}

local DEFAULT_PICKER=""

local function load_symbols_file()
    local symbols_list = {}
    return symbols_list
end

local function insert_symbol_mini_pick()
    local symbols = load_symbols_file() 
    print(symbols)
end

function M.setup()
    -- setup defaults (right now only one, so this is a placeholder)
    DEFAULT_PICKER = "mini"

    -- generic insert symbol
    vim.api.nvim_create_user_command('WimsInsertSymbol', function()
        if DEFAULT_PICKER == "mini" then
            insert_symbol_mini_pick()
        end
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsInsertSymbolMiniPick", function()
        insert_symbol_mini_pick()
    end, {})
end

return M
