return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local servers = { 'clangd', 'rust_analyzer', 'pyright', 'gopls' }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
      }
    end

    local keymap = vim.keymap
    keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    keymap.set('n', '[d', vim.diagnostic.goto_prev)
    keymap.set('n', ']d', vim.diagnostic.goto_next)
    keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local api = vim.api
    local buf = vim.lsp.buf
    api.nvim_create_autocmd('LspAttach', {
      group = api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        keymap.set('n', 'gD', buf.declaration, opts)
        keymap.set('n', 'gd', buf.definition, opts)
        keymap.set('n', 'K', buf.hover, opts)
        keymap.set('n', 'gi', buf.implementation, opts)
        keymap.set('n', '<C-k>', buf.signature_help, opts)
        keymap.set('n', '<leader>wa', buf.add_workspace_folder, opts)
        keymap.set('n', '<leader>wr', buf.remove_workspace_folder, opts)
        keymap.set('n', '<leader>wl', function()
          print(vim.inspect(buf.list_workspace_folders()))
        end, opts)
        keymap.set('n', '<leader>D', buf.type_definition, opts)
        keymap.set('n', '<leader>rn', buf.rename, opts)
        keymap.set({ 'n', 'v' }, '<leader>ca', buf.code_action, opts)
        keymap.set('n', 'gr', buf.references, opts)
        keymap.set('n', '<leader>f', function()
          buf.format { async = true }
        end, opts)
      end,
    })
  end
}
