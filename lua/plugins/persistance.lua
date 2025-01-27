return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = function()
		local persistence = require("persistence")

		persistence.setup({
      dir = vim.fn.stdpath("data") .. "/sessions/",
      need = 1,
      branch = true,
    })

		vim.keymap.set("n", "<leader>qs", persistence.load, { desc = "Load session for the current directory" })

		vim.keymap.set("n", "<leader>qS", persistence.select, { desc = "Select session to load" })

		vim.keymap.set("n", "<leader>ql", function()
			require("persistence").load({ last = true })
		end, { desc = "Load last session" })

		vim.keymap.set("n", "<leader>qd", persistence.stop, { desc = "Stop Persistence" })
	end,
}
