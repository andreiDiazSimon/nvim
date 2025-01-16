-- Lua
return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
	init = function()
		-- load the session for the current directory
		vim.keymap.set("n", "<leader>ss", function() require("persistence").load() end,
			{ desc = "Load session for current directory" })

		-- select a session to load
		vim.keymap.set("n", "<leader>sS", function() require("persistence").select() end,
			{ desc = "Select a session to load" })

		-- load the last session
		vim.keymap.set("n", "<leader>sl", function() require("persistence").load({ last = true }) end,
			{ desc = "Load last session" })

		-- stop Persistence => session won't be saved on exit
		vim.keymap.set("n", "<leader>sd", function() require("persistence").stop() end,
			{ desc = "Stop session persistence" })
	end
}
