local lspconfig = require('lspconfig')
local utils = require('lsp.utils')
local on_attach = utils.common_on_attach

-- add capabilities from nvim-cmp
local capabilites = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilites(capabilities)

lspconfig.util.default_config = capabilities

require "lsp_signature".setup(cfg)
