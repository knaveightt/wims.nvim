local M = {}

local PREFERRED_PICKER=""
local PICKER

local function insert_symbol(character)
    if character ~= nil then
        local pos = vim.api.nvim_win_get_cursor(0)[2]
        local c_line = vim.api.nvim_get_current_line()
        local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
        vim.api.nvim_set_current_line(n_line)
    end
end

local function yank_symbol(character)
    if character ~= nil then
        vim.fn.setreg('"', character)
    end
end

function M.insert_symbol_now(character)
    insert_symbol(character)
end

function M.yank_symbol_now(character)
    yank_symbol(character)
end

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
        local character = PICKER.pick_symbol("insert")
        insert_symbol(character)
    end, {})

    -- generic yank symbol
    vim.api.nvim_create_user_command('WimsYankSymbol', function ()
        local character = PICKER.pick_symbol("yank")
        yank_symbol(character)
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsInsertSymbolMiniPick", function()
        local character = require("wims.pickers.mini").pick_symbol("insert")
        insert_symbol(character)
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsYankSymbolMiniPick", function()
        local character = require("wims.pickers.mini").pick_symbol("yank")
        yank_symbol(character)
    end, {})

    -- for using a specific picker (telescope)
    vim.api.nvim_create_user_command("WimsInsertSymbolTelescope", function()
        local character = require("wims.pickers.tscope").pick_symbol("insert")
        insert_symbol(character)
    end, {})

    -- for using a specific picker (telescope)
    vim.api.nvim_create_user_command("WimsYankSymbolTelescope", function()
        local character = require("wims.pickers.tscope").pick_symbol("yank")
        yank_symbol(character)
    end, {})
end

return M
