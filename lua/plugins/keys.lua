return {
  "tamton-aquib/keys.nvim",
  config = function()
    require("keys").setup({
      enable_on_startup = true,
      win_opts = {
        width = 25,
      },
    })
  end,
}
