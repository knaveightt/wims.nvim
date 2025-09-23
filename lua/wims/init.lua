local M = {}

local PREFERRED_PICKER=""
local PICKER

function M.setup()
    -- setup defaults (right now only one, so this is a placeholder)
    PREFERRED_PICKER = "mini"

    local picker
    if PREFERRED_PICKER == "mini" then
        PICKER = require("wims.pickers.mini")
    else
        PICKER = require("wims.pickers.mini") -- default
    end

    -- generic insert symbol
    vim.api.nvim_create_user_command('WimsInsertSymbol', function()
        PICKER.pick_symbol("insert")
    end, {})

    -- generic yank symbol
    vim.api.nvim_create_user_command('WimsYankSymbol', function ()
        PICKER.pick_symbol("yank")
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsInsertSymbolMiniPick", function()
        require("wims.pickers.mini").pick_symbol("insert")
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsYankSymbolMiniPick", function()
        require("wims.pickers.mini").pick_symbol("yank")
    end, {})

    -- for using a specific picker (telescope)
    vim.api.nvim_create_user_command("WimsInsertSymbolTelescope", function()
        require("wims.pickers.tscope").pick_symbol("insert")
    end, {})

    -- for using a specific picker (telescope)
    vim.api.nvim_create_user_command("WimsYankSymbolTelescope", function()
        require("wims.pickers.tscope").pick_symbol("yank")
    end, {})
end

return M
