return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      auto_install = true,
      indent = { enabled = true },
      highlight = {
        enabled = true,
        additional_vim_regex_highlighting = true,
      },
    })
  end,
}
