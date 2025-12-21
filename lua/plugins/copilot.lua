return {
	"github/copilot.vim",
	config = function()
		vim.api.nvim_create_user_command("Silencio", "Copilot disable", {})
    vim.api.nvim_create_user_command("Ruido", "Copilot enable", {})

    vim.keymap.set('n', '<leader>cs', ':Silencio<CR>', { desc = "Disable Copilot" })
    vim.keymap.set('n', '<leader>cr', ':Ruido<CR>', { desc = "Enable Copilot" })
	end,
}
