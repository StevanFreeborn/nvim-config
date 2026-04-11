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
        },
      },
      window = {
        mappings = {
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
              vim.notify("Copied: " .. path .. " to clipboard")
            end,
            desc = "Copy path to clipboard",
          },
          ["O"] = {
            function(state)
              local node = state.tree:get_node()
							vim.notify("Opening: " .. node.path)

              local _, err = vim.ui.open(node.path)

              if err then
                vim.notify("Error opening explorer: " .. err, vim.log.levels.ERROR)
              end
            end,
            desc = "Open in default app",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            vim.cmd("Neotree close")
          end,
        },
      },
    })
    vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal right<CR>", { desc = "Neotree show explorer" })
  end,
}
