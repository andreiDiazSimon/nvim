return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/lazydev.nvim" },
	config = function()
		require("dapui").setup()
		-- require("lazydev").setup({
		-- 	library = {
		-- 		"nvim-dap-ui",
		-- 		-- See the configuration section for more details
		-- 		-- Load luvit types when the `vim.uv` word is found
		-- 		{ path = "${3rd}/luv/library", words = { "vim%.uv" } }, },
		-- })
		vim.keymap.set('n', '<leader>duio', function() require('dapui').open() end, { desc = "Open DAP UI" })
		vim.keymap.set('n', '<leader>duic', function() require('dapui').close() end, { desc = "Close DAP UI" })
		vim.keymap.set('n', '<leader>duit', function() require('dapui').toggle() end, { desc = "Toggle DAP UI" })
	end
}
