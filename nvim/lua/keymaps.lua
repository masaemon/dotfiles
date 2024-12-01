local opts = { noremap=true, silent=true }

-- Leaderをスペースに
vim.g.mapleader = " "

-- :を;でも使えるように
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })

-- ウィンドウの移動 
vim.api.nvim_set_keymap("n", "<c-h>", "<c-w><c-h>", { noremap = true }) 
vim.api.nvim_set_keymap("n", "<c-j>", "<c-w><c-j>", { noremap = true }) 
vim.api.nvim_set_keymap("n", "<c-k>", "<c-w><c-k>", { noremap = true }) 
vim.api.nvim_set_keymap("n", "<c-l>", "<c-w><c-l>", { noremap = true }) 
vim.api.nvim_set_keymap("v", "<c-h>", "<c-w><c-h>", { noremap = true }) 
vim.api.nvim_set_keymap("v", "<c-j>", "<c-w><c-j>", { noremap = true }) 
vim.api.nvim_set_keymap("v", "<c-k>", "<c-w><c-k>", { noremap = true }) 
vim.api.nvim_set_keymap("v", "<c-l>", "<c-w><c-l>", { noremap = true }) 

-- かっこのカーソル移動
vim.api.nvim_set_keymap("i", "'", "''<esc>i", { noremap = true }) 
vim.api.nvim_set_keymap("i", "\"", "\"\"<esc>i", { noremap = true }) 
vim.api.nvim_set_keymap("i", "(", "()<esc>i", { noremap = true }) 
vim.api.nvim_set_keymap("i", "[", "[]<esc>i", { noremap = true }) 
vim.api.nvim_set_keymap("i", "{", "{}<esc>i", { noremap = true }) 

-- インサートモード中の移動
vim.api.nvim_set_keymap("i", "<c-h>", "<c-o>h", { noremap = true }) 
vim.api.nvim_set_keymap("i", "<c-j>", "<c-o>j", { noremap = true }) 
vim.api.nvim_set_keymap("i", "<c-k>", "<c-o>k", { noremap = true }) 
vim.api.nvim_set_keymap("i", "<c-l>", "<c-o>l", { noremap = true }) 
vim.api.nvim_set_keymap("i", "<c-f>", "<c-o>a", { noremap = true }) 

-- ツリーの表示
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true }) 
vim.api.nvim_set_keymap("v", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true }) 

-- fzf-lua
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>s', "<cmd>lua require('fzf-lua').git_status()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').git_branches()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>/', "<cmd>lua require('fzf-lua').blines()<CR>", opts)

-- nvim-lsp
vim.api.nvim_set_keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap('n', 'gf', "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
vim.api.nvim_set_keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap('n', 'gn', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap('n', 'ga', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- バッファの移動
vim.api.nvim_set_keymap("n","<tab>",":bnext<cr>", {})
vim.api.nvim_set_keymap("n","<s-tab>",":bprevious<cr>", {})
