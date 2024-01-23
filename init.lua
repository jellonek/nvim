require("core")
require("core/lazy")

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
