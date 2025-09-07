local M = {}

local DEFAULT_PICKER=""

local function insert_symbol_into_line(character)
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local c_line = vim.api.nvim_get_current_line()
	local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
	vim.api.nvim_set_current_line(n_line)
end

local function load_symbols_file()
    local symbols_list = require("wims.symbols.symbol_list")
    return symbols_list
end

local function pick_symbol_mini_pick()
    -- load symbols
    local symbols = load_symbols_file()

    -- choose symbol and get character
	local choice = MiniPick.start({ source = { items = symbols } })
	local character = string.gsub(choice, "\t.*", "")

    return character
end

local function yank_symbol_mini_pick()
    -- get character
    local character = pick_symbol_mini_pick()

    -- yank character
    vim.fn.setreg('"', character)
end

local function insert_symbol_mini_pick()
    -- get character
    local character = pick_symbol_mini_pick()

    -- print character
    insert_symbol_into_line(character)
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

    vim.api.nvim_create_user_command('WimsYankSymbol', function ()
        if DEFAULT_PICKER == "mini" then
            yank_symbol_mini_pick()
        end
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsInsertSymbolMiniPick", function()
        insert_symbol_mini_pick()
    end, {})

    -- for using a specific picker
    vim.api.nvim_create_user_command("WimsYankSymbolMiniPick", function()
        yank_symbol_mini_pick()
    end, {})
end

return M
