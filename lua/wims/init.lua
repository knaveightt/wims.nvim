local M = {}

function M.setup()
    vim.api.nvim_create_user_command('WimsInsertSymbol', function() 
        print("Activated Hello")
    end, {})
end


return M
