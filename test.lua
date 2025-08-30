-- local testing = function ()
--     vim.ui.select({ 'tabs', 'spaces' }, {
--
--         prompt = 'Select tabs or spaces:',
--         format_item = function(item)
--             return "I'd like to choose " .. item
--         end,
--     }, function(choice)
--         if choice == 'spaces' then
--             print("You Chose Spaces")
--         else
-- 			print("You Chose Tabs")
--         end
--     end)
-- end

local testing2 = function ()
	local source_items = {}
	for line in io.lines("glyphs.txt") do
		local parsed_line = string.gsub(line, ":", "\t")
		table.insert(source_items, parsed_line)
	end
	local choice = MiniPick.start({ source = { items = source_items } })
	local character = string.gsub(choice, "\t.*", "")

	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local c_line = vim.api.nvim_get_current_line()
	local n_line = c_line:sub(0,pos) .. character .. c_line:sub(pos+1)
	vim.api.nvim_set_current_line(n_line)
end

-- testing()
testing2()



