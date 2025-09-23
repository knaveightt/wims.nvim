local M = {}

local PICKER

function M.setup(opts)
    -- expecting { picker = "mini|telescope" }
    if opts then
        if opts.picker == "mini" then
            PICKER = require("wims.pickers.mini")
        elseif opts.picker == "telescope" then
            PICKER = require("wims.pickers.tscope")
        else
            PICKER = require("wims.pickers.mini") -- default
        end
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
