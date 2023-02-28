local nvim_lsp = require('lspconfig')
local servers = require('lsp.servers')
local utils = require('lsp.utils')
local on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilites = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers.server_list) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilites = capabilites,
  })
end

require "lsp_signature".setup({})
