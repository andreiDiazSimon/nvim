return {
	'mfussenegger/nvim-dap',
	config = function()
		local dap = require('dap')
		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
  args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
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
		vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
		vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
		vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
		vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
		  require('dap.ui.widgets').hover()
		end)
		vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
		  require('dap.ui.widgets').preview()
		end)
		vim.keymap.set('n', '<Leader>df', function()
		  local widgets = require('dap.ui.widgets')
		  widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set('n', '<Leader>ds', function()
		  local widgets = require('dap.ui.widgets')
		  widgets.centered_float(widgets.scopes)
		end)
	end,
}
