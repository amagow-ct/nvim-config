local fn = vim.fn
local api = vim.api

-- bootstrap packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

local packCompileGroup = api.nvim_create_augroup("PackerUserConfig", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
  group = packCompileGroup,
})


if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
 
  -- THEMES
  -- Theme inspired by Atom
  use 'joshdick/onedark.vim'

  -- LSP management (must come first as per mason-lspconfig.nvim's instructions)
  use 'williamboman/mason.nvim'
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function() require('plugins.mason-lspconfig') end,
  }
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end,
  }

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  })

   -- Snippets
  use {"L3MON4D3/LuaSnip", config = function() require('plugins.snippets') end}
  use "rafamadriz/friendly-snippets"

 -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }},
    config = function() require('plugins.telescope') end,
  })

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    tag = "v3.*",
    config = function() require('plugins.bufferline') end,
  }

  -- Pretty status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugins.lualine') end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require('plugins.nvimtree') end
  } 

   -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter', config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  }
  
   -- Git
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end,
  }

  -- Startup
use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function() require('plugins.dashboard') end,
  requires = {'nvim-tree/nvim-web-devicons'}
}

  -- Indent Line
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end,
  }

  -- Comments
  use { 
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup({}) end,
  }

  -- Formatting
  use 'tpope/vim-surround'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
