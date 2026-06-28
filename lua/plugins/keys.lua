return {
	"NStefan002/screenkey.nvim",
	lazy = false,
	version = "*",
	config = function()
		vim.keymap.set("n", "<leader>sk", function()
			require("screenkey").toggle()
		end, { desc = "Toggle screenkey" })
	end,
}
