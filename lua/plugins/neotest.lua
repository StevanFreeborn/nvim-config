return {
  "nvim-neotest/neotest",
  dependencies = {
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
    "issafalcon/neotest-dotnet",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      log_level = "debug",
      adapters = {
        require("neotest-python"),
        require("neotest-jest"),
        require("neotest-vitest"),
        require("neotest-playwright").adapter({
          options = {
            log_level = "DEBUG",
            persist_project_selection = false,
            enable_dynamic_test_discovery = true,
            preset = "headed",
            experimental = {
              telescope = {
                enable = true,
              },
            },
            get_playwright_binary = function()
              return vim.loop.cwd() .. "/node_modules/.bin/playwright"
            end,
          },
        }),
        require("neotest-dotnet")({
          dap = {
            adapter_name = "coreclr",
          },
          discovery_root = "solution",
        }),
      },
    })

    vim.keymap.set("n", "<leader>tr", neotest.run.run, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Debug nearest test" })

    vim.keymap.set("n", "<leader>ts", neotest.run.stop, { desc = "Stop nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run file tests" })

    vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Display output" })
    vim.keymap.set("n", "<leader>top", neotest.output_panel.open, { desc = "Display output panel" })
    vim.keymap.set("n", "<leader>topc", neotest.output_panel.clear, { desc = "Clear output" })
    vim.keymap.set("n", "<C-t>", neotest.summary.open, { desc = "Display summary" })
    vim.keymap.set("n", "<leader>tsr", neotest.summary.run_marked, { desc = "Run marked tests" })
    vim.keymap.set("n", "<leader>tsc", neotest.summary.clear_marked, { desc = "Clear marked tests" })
    vim.keymap.set("n", "<leader>tw", neotest.watch.watch, { desc = "Start watching tests" })
    vim.keymap.set("n", "<leader>twc", neotest.watch.stop, { desc = "Stop watching tests" })
  end,
}
