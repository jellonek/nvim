return {
  'kevinhwang91/nvim-ufo',
  enabled = false,
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers()
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup({
        capabilities = capabilities
      })
    end
    require('ufo').setup()
  end
}
