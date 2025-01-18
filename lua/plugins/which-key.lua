return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("which-key").setup()
  end
}
