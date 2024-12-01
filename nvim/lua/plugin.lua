-- vim-jetpackのインストール
local jetpackfile = vim.fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
  vim.fn.system(string.format('curl -fsSLo %s --create-dirs %s', jetpackfile, jetpackurl))
end

vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
  {'tani/vim-jetpack', opt = 1}, -- bootstrap
  {'tpope/vim-vinegar'}, -- 同じバッファにファイルツリーを表示して選択したファイルを表示してくれる
  {'nvim-tree/nvim-web-devicons', opt = 1}, -- アイコン
  {'nvim-tree/nvim-tree.lua'}, -- ファイラー
  {'nvim-lualine/lualine.nvim'}, -- ステータスライン
  {'williamboman/mason.nvim', run = ':MasonUpdate'}, -- lspの設定
  {'williamboman/mason-lspconfig.nvim'}, -- lspの設定
  {'neovim/nvim-lspconfig'}, -- lspの設定
  {'hrsh7th/cmp-nvim-lsp'}, -- 補完ライブラリ
  {'hrsh7th/cmp-buffer'}, -- 補完ライブラリ
  {'hrsh7th/cmp-path'}, -- 補完ライブラリ
  {'hrsh7th/cmp-cmdline'}, -- 補完ライブラリ
  {'hrsh7th/nvim-cmp'}, -- 補完ライブラリ
  {'hrsh7th/cmp-vsnip'}, -- 補完ライブラリ
  {'hrsh7th/vim-vsnip'}, -- 補完ライブラリ
  {'junegunn/fzf', run = './install --bin'}, -- あいまい検索
  {'ibhagwan/fzf-lua'}, -- あいまい検索
  {'cocopon/iceberg.vim'}, -- カラースキーム
}

local jetpack = require('jetpack')
for _, name in ipairs(jetpack.names()) do
  if not jetpack.tap(name) then
    jetpack.sync()
    break
  end
end

-- ステータスラインの設定
require('lualine').setup {
  options = {
    theme = iceberg_dark,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

-- ファイラーの設定
local HEIGHT_RATIO = 0.8  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

require('nvim-tree').setup({
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
})

-- 補完ライブラリ
local cmp = require('cmp')
cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
    }
  end,
}

-- fzf-lua
require('fzf-lua').setup({})

-- lsp
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"clangd", "jsonls", "pyright", "rust_analyzer", "sqlls", "yamlls"}
})
