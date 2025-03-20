vim.g.mapleader = " "
require("config.lazy")
vim.g.netrw_liststyle = 2
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
vim.keymap.set('i', '<C-s>', function()
	vim.cmd(':w')
	vim.api.nvim_input('<Esc>')
end, { noremap = true, silent = true })

vim.keymap.set('n', 'vag', 'ggVG', { noremap = true, silent = true, desc = "Select entire file" })
vim.keymap.set('n', 'ga', 'ggVGy', { noremap = true, silent = true, desc = "Select entire file and copy" })


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.wrap = true

-- Use the system clipboard for all yank, delete, change and paste operations
vim.opt.clipboard = 'unnamedplus'
-- Enable case-insensitive search
vim.opt.ignorecase = true

-- Enable smart case (overrides ignorecase if uppercase letters are used in the search)
vim.opt.smartcase = true

-- cursor to stay in block mode
vim.opt.guicursor = ""

vim.opt.undofile = true                               -- Enable persistent undo and redo
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Directory for undo files

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25

vim.keymap.set('n', '<leader>l', ':Lazy show<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { noremap = true, silent = true })

-- Yank selected text to clipboard when pressing y in visual mode
-- vim.keymap.set('v', 'y', '"+y', { noremap = true })

vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })

vim.keymap.set('i', 'jk', '<Esc>l', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })



-- transparent cursorLine highlight background
vim.cmd [[ highlight CursorLine guibg=NONE ]]

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

-- highight sa float fg and bg color
vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#5a5b5e", bg = "none" })
-- highight sa float border fg and bg color
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5a5b5e", bg = "none" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#7c5c20", bg = "none" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#833b3b", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#2b5d63", bg = "none" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#79428a", bg = "none" })

vim.keymap.set('n', '<leader>sh', ':!./%\n', { noremap = true, silent = true, desc = "execute current bash script" })
