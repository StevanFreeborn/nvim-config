return {
	"StevanFreeborn/watchexec.nvim",
	lazy = false,
	config = function()
		require("watchexec").setup({
			indicator = {
				padding = { x = 2, y = 3 },
			},
		})

		vim.api.nvim_set_hl(0, "WatchexecSuccess", { bg = "#7ec8c0" })
		vim.api.nvim_set_hl(0, "WatchexecFailure", { bg = "#d47373" })
	end,
}
