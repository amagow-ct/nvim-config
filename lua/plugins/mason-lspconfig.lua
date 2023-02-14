require('mason').setup()
require("mason-lspconfig").setup { 
  ensure_installed = {"gopls", "lua_ls"},
  automatic_installation = true,
}


