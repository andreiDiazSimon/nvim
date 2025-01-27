vim.g.mapleader = " "
require("config.lazy")
vim.g.netrw_liststyle = 2
-- transparent cursorLine highlight background
vim.cmd [[ highlight CursorLine guibg=NONE ]]
vim.keymap.set('n', '<leader>e', function()
	if vim.bo.filetype == 'netrw' then
		vim.cmd(':bd')
	else
		vim.cmd(':Ex')
	end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-s>', function()
	vim.cmd(':w')
end, { noremap = true, silent = true })


vim.keymap.set('n', '<S-h>', function()
	vim.cmd(':tabp')
end, { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', function()
	vim.cmd(':tabn')
end, { noremap = true, silent = true })

vim.keymap.set('i', '<C-s>', function()
	vim.cmd(':w')
	vim.api.nvim_input('<Esc>')
end, { noremap = true, silent = true })
vim.keymap.set('n', 'vag', 'ggVG', { noremap = true, silent = true, desc = "Select entire file" })
vim.keymap.set('n', 'ga', 'ggVGy', { noremap = true, silent = true, desc = "Select entire file and copy" })


vim.keymap.set('n', 'gj', '<C-d>', { noremap = true, silent = true, desc = "scroll down" })
vim.keymap.set('n', 'gk', '<C-u>', { noremap = true, silent = true, desc = "scroll up" })
vim.keymap.set('n', 'gl', '$', { noremap = true, silent = true, desc = "go utmost right" })
vim.keymap.set('n', 'gh', '0', { noremap = true, silent = true, desc = "go utmost left" })

--vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'

-- you set it to a very large value (999) the cursor line will always be in the middle of the window (except at the start or end of the file or	when long lines wrap)
vim.opt.scrolloff = 999

-- Use the system clipboard for all yank, delete, change and paste operations
vim.opt.clipboard = 'unnamedplus'
-- Enable case-insensitive search
vim.opt.ignorecase = true

-- Enable smart case (overrides ignorecase if uppercase letters are used in the search)
vim.opt.smartcase = true

-- cursor to stay in block mode
vim.opt.guicursor = ""

vim.keymap.set('n', '<leader>l', ':Lazy show<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { noremap = true, silent = true })

-- Yank selected text to clipboard when pressing y in visual mode
vim.keymap.set('v', 'y', '"+y', { noremap = true })

vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })

vim.keymap.set('i', 'jk', '<Esc>l', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

vim.opt.undofile = true                      -- Enable persistent undo and redo
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Directory for undo files


vim.keymap.set('n', '<leader>sh', ':!./%\n', {noremap = true, silent = true , desc = "execute current bash script"})
