local serverList = require("lsp.servers").server_list
require('mason').setup()
require("mason-lspconfig").setup {
  ensure_installed = serverList,
  automatic_installation = true,
}
