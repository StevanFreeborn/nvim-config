return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "vue",
        "yaml",
        "c_sharp",
        "rust",
        "csv",
        "dockerfile",
        "editorconfig",
        "json",
        "jsdoc",
        "jsonc",
        "markdown",
        "markdown_inline",
        "nginx",
        "proto",
        "sql",
        "toml",
        "ssh_config",
        "xml",
      },
      indent = { enabled = true },
      highlight = {
        enabled = true,
      },
    })
  end,
}
