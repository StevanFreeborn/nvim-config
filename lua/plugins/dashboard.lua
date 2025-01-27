return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local logo = [[





███╗   ██╗ ██████╗      ██████╗ ███╗   ██╗███████╗     ██████╗ █████╗ ██████╗ ███████╗███████╗
████╗  ██║██╔═══██╗    ██╔═══██╗████╗  ██║██╔════╝    ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝
██╔██╗ ██║██║   ██║    ██║   ██║██╔██╗ ██║█████╗      ██║     ███████║██████╔╝█████╗  ███████╗
██║╚██╗██║██║   ██║    ██║   ██║██║╚██╗██║██╔══╝      ██║     ██╔══██║██╔══██╗██╔══╝  ╚════██║
██║ ╚████║╚██████╔╝    ╚██████╔╝██║ ╚████║███████╗    ╚██████╗██║  ██║██║  ██║███████╗███████║
╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
    ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ██╗  ██╗ █████╗ ██████╗ ██████╗ ███████╗██████╗    
    ██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗   
    ██║ █╗ ██║██║   ██║██████╔╝█████╔╝     ███████║███████║██████╔╝██║  ██║█████╗  ██████╔╝   
    ██║███╗██║██║   ██║██╔══██╗██╔═██╗     ██╔══██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██╔══██╗   
    ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗    ██║  ██║██║  ██║██║  ██║██████╔╝███████╗██║  ██║   
     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝   
                                                                                              





    ]]

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{ action = 'lua require("telescope.builtin").find_files()', desc = " Find File", icon = " ", key = "f" },
					{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
					{ action = 'lua require("telescope.builtin").oldfiles()', desc = " Recent Files", icon = " ", key = "r" },
					{ action = 'lua require("telescope.builtin").live_grep()', desc = " Find Text", icon = " ", key = "g" },
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		require("dashboard").setup(opts)

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

	end,
}
