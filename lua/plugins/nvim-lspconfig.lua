return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local lspconfig = require("lspconfig")
    local settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        },
        telemetry = false
      }
    }

    local servers = {
      -- bash/sh. requires npm installed bash-language-server
      'bashls',

      -- c/cpp/objc/objcpp/cuda/proto. requires clang package which should
      -- be providing clangd binary
      'clangd',

      -- dlang. requires binary from https://github.com/Pure-D/serve-d/releases
      'serve_d',

      -- dockerfile. requires npm installed docker-langserver
      'dockerls',

      -- rust. requires normal rust installation
      'rust_analyzer',

      -- python. requires npm installed pyright
      'pyright',

      -- golang. requires go get golang.org/x/tools/gopls
      'gopls',

      -- lua. requires https://github.com/luals/lua-language-server installed in $PATH
      'lua_ls',
    }

    local on_attach = function(_, buffer_number)
      vim.api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "LSP: Format current buffer content with LSP" })
    end

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = default_capabilities,
        settings = settings,
        on_attach = on_attach,
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