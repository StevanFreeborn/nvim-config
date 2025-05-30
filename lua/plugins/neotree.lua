return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
        }
      },
      event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              vim.cmd("Neotree close")
            end
          },

        }
    })
    vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal right<CR>", { desc = "Neotree show explorer" })
	end,
}
