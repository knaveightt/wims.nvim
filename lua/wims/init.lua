local M = {}

local DEFAULT_PICKER=""

function M.setup()
    -- setup defaults (right now only one, so this is a placeholder)
    DEFAULT_PICKER = "mini"

    -- generic insert symbol
    vim.api.nvim_create_user_command('WimsInsertSymbol', function()
        if DEFAULT_PICKER == "mini" then
            require("wims.pickers.mini").insert_symbol()
        end
    end, {})

    -- generic yank symbol
    vim.api.nvim_create_user_command('WimsYankSymbol', function ()
        if DEFAULT_PICKER == "mini" then
            require("wims.pickers.mini").yank_symbol()
        end
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsInsertSymbolMiniPick", function()
        require("wims.pickers.mini").insert_symbol()
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsYankSymbolMiniPick", function()
        require("wims.pickers.mini").yank_symbol()
    end, {})
end

return M
