return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")

			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

			Buffer_searcher = function()
				builtin.buffers({
          initial_mode = "normal",
					sort_mru = true,
					attach_mappings = function(prompt_buffer, map)
            local refresh_buffer_searcher = function()
                actions.close(prompt_buffer)
                vim.schedule(Buffer_searcher)
            end

						local delete_buf = function()
							local picker = action_state.get_current_picker(prompt_buffer)
							local selection = picker:get_multi_selection()
							for _, entry in ipairs(selection) do
								vim.api.nvim_buf_delete(entry.bufnr, { force = true })
							end
              refresh_buffer_searcher()
						end

						map("n", "dd", delete_buf)

						return true
					end,
				})
			end

			vim.keymap.set("n", "<leader>fb", Buffer_searcher, { desc = "Telescope buffers" })

			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
	},
}
