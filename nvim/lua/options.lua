-- Helpページの言語
vim.o.helplang = "ja,en"

-- 背景の色
-- vim.o.background = "dark"

-- カラースキームの設定
vim.cmd.colorscheme("iceberg")

-- ファイル種別のプラグイン・インデントを有効化
vim.cmd("filetype plugin indent on")

-- シンタックスハイライトを有効化
vim.cmd("syntax on")

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.encoding = "utf-8"
vim.o.cursorline = true

-- セーブしなくてもバッファの移動ができる
vim.o.hidden = true

-- 検索のハイライト
vim.o.hlsearch = true

-- インクリメンタルサーチ
vim.o.incsearch = true

-- 永続undoの設定
vim.o.undofile = false
local undodir = vim.fn.stdpath('data') .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p", 0700)
end
vim.o.undodir = undodir

-- netrwを無効
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

