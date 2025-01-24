package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

require("core")
require("core/lazy-bootstrap")

require("lazy").setup(
  {
    import = "plugins",
  },
  {
    install = {
      colorscheme = { "wombat256mod" },
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false
    }
  }
)
