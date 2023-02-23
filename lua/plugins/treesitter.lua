require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'lua',
    'css',
    'json',
    'go',
    'vim',
    'html',
  },
})
