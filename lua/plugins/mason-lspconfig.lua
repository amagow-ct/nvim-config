local serverList = require("lsp.servers").server_list
require('mason').setup({
  PATH = "append",
})
require("mason-lspconfig").setup {
  ensure_installed = serverList,
  automatic_installation = true,
}
