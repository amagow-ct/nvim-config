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
  use 'neovim/nvim-lspconfig'



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
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  }
  
   -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end,
  }


  -- Comments
  use { 
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup({}) end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
