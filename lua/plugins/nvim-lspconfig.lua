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
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities(capabilities))
    local lspconfig = require("lspconfig")

    local servers = {
      -- bash/sh. requires npm installed bash-language-server
      bashls = {},

      -- c/cpp/objc/objcpp/cuda/proto. requires clang package which should
      -- be providing clangd binary
      clangd = {},

      -- dlang. requires binary from https://github.com/Pure-D/serve-d/releases
      serve_d = {},

      -- dockerfile. requires npm installed docker-langserver
      dockerls = {},

      -- rust. requires normal rust installation
      rust_analyzer = {},

      -- python. requires npm installed pyright
      pyright = {},

      -- golang. requires go get golang.org/x/tools/gopls
      gopls = {},

      -- lua. requires https://github.com/luals/lua-language-server installed in $PATH
      lua_ls = {
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
    }

    local api = vim.api
    local on_attach = function(_, buffer_number)
      api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "LSP: Format current buffer content with LSP" })
    end

    for lsp, settings in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
        settings = settings,
        on_attach = on_attach,
      }
    end

    local keymap = vim.keymap

    local map = function(keys, func, desc)
      keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
    end

    map('<leader>e', vim.diagnostic.open_float, 'Open diagnostics float')
    map('[d', vim.diagnostic.goto_prev, 'Diagnostics go to next')
    map(']d', vim.diagnostic.goto_next, 'Diagnostics go to previous')
    map('<leader>q', vim.diagnostic.setloclist, 'Add buffer diagnostics to the location list')

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local buf = vim.lsp.buf
    api.nvim_create_autocmd('LspAttach', {
      group = api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local mmap = function(mode, keys, func, desc)
          keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        mmap('n', 'gD', buf.declaration, 'Go to symbol declaration')
        mmap('n', 'gd', buf.definition, 'Go to symbol definition')
        mmap('n', 'K', buf.hover, 'Displays hover information in a floating window')
        mmap('n', 'gi', buf.implementation, 'Go to symbol implementation')
        mmap('n', '<C-k>', buf.signature_help, 'Show signature')
        mmap('n', '<leader>wa', buf.add_workspace_folder, 'Add curdir to list of workspaces')
        mmap('n', '<leader>wr', buf.remove_workspace_folder, 'Remove curdir from list of workspaces')
        mmap('n', '<leader>wl', function()
          print(vim.inspect(buf.list_workspace_folders()))
        end, 'Show list of workspaces')
        mmap('n', '<leader>D', buf.type_definition, 'Show type definition')
        mmap('n', '<leader>rn', buf.rename, 'Rename symbol')
        mmap({ 'n', 'v' }, '<leader>ca', buf.code_action, 'Code action')
        mmap('n', 'gr', buf.references, 'Show symbol references')
        mmap('n', '<leader>f', function()
          buf.format { async = true }
        end, 'Format buffer')
      end,
    })
  end
}
