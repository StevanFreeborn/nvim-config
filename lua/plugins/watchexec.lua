return {
  "StevanFreeborn/watchexec.nvim",
  lazy = false,
  config = function()
    vim.api.nvim_set_hl(0, "WatchexecSuccess", { bg = "#7ec8c0" })
    vim.api.nvim_set_hl(0, "WatchexecFailure", { bg = "#d47373" })
  end,
}
