return {
	'mfussenegger/nvim-dap',
	config = function()
		local dap = require('dap')
		----------------
		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
		}
		dap.configurations.javascript = {
			{
				name = 'Launch',
				type = 'node2',
				request = 'launch',
				program = '${file}',
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = 'inspector',
				console = 'integratedTerminal',
			},
			{
				-- For this to work you need to make sure the node process is started with the `--inspect` flag.
				name = 'Attach to process',
				type = 'node2',
				request = 'attach',
				processId = require 'dap.utils'.pick_process,
			},
		}

		vim.keymap.set('n', '<leader>dc', ':lua require("dap").continue()<CR>')
		vim.keymap.set('n', '<leader>do', ':lua require("dap").step_over()<CR>')
		vim.keymap.set('n', '<leader>dO', ':lua require("dap").step_out()<CR>')
		vim.keymap.set('n', '<leader>di', ':lua require("dap").step_into()<CR>')
		vim.keymap.set('n', '<Leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
		-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
		-- vim.keymap.set('n', '<Leader>dlp',
		-- 	":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
		-- vim.keymap.set('n', '<Leader>dro', ":lua require('dap').repl.open()<CR>")
		-- vim.keymap.set('n', '<Leader>drc', ":lua require('dap').repl.close()<CR>")
		vim.keymap.set('n', '<Leader>dl', ":lua require('dap').run_last()<CR>")


		vim.keymap.set('n', '<Leader>dt', ":lua require('dap').terminate()<CR>")
		--dap.clear_breakpoints()
		vim.keymap.set('n', '<Leader>dx', ":lua require('dap').clear_breakpoints()<CR>")

		--        *dap.run_to_cursor()*
		--         Continues execution to the current cursor.
		--         This temporarily removes all breakpoints, sets a breakpoint at the
		--         cursor, resumes execution and then adds back all breakpoints again.
		vim.keymap.set('n', '<leader>dcc', ':lua require("dap").run_to_cursor()<CR>')
		vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
			require('dap.ui.widgets').hover()
			-- widgets.hover(widgets.scopes).open()
		end)
		vim.keymap.set('n', '<Leader>ds', function()
			local widgets = require('dap.ui.widgets')
			widgets.sidebar(widgets.scopes).open()
		end)
	end,
}
