return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hoffs/omnisharp-extended-lsp.nvim" },
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        on_new_config = function(config, new_root_dir)
          config.settings.workspaceFolder = {
            uri = vim.uri_from_fname(new_root_dir),
            name = vim.fn.fnamemodify(new_root_dir, ":t"),
          }
        end,
      })

      lspconfig.omnisharp.setup({
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        cmd = { "dotnet", "C:/Users/sfree/AppData/Local/nvim-data/omnisharp/OmniSharp.dll" },
        capabilities = capabilities,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          Sdk = {
            IncludePrereleases = true,
          },
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        filetypes = { "html", "ejs" },
        capabilities = capabilities,
      })

      lspconfig.cssls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.lemminx.setup({
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local omnisharp = require("omnisharp_extended")

          if client.name == "omnisharp" then
            vim.keymap.set(
              "n",
              "gd",
              omnisharp.telescope_lsp_definition,
              { desc = "Go to definition", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "gi",
              omnisharp.telescope_lsp_implementation,
              { desc = "Go to implementation", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "gr",
              omnisharp.telescope_lsp_references,
              { desc = "Go to references", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "<leader>D",
              omnisharp.telescope_lsp_type_definition,
              { desc = "Go to type definition", buffer = ev.buf }
            )
          else
            vim.keymap.set(
              "n",
              "gd",
              vim.lsp.buf.definition,
              { desc = "Go to definition", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "gD",
              vim.lsp.buf.declaration,
              { desc = "Go to declaration", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "gi",
              vim.lsp.buf.implementation,
              { desc = "Go to implementation", buffer = ev.buf }
            )

            vim.keymap.set(
              "n",
              "gr",
              vim.lsp.buf.references,
              { desc = "Go to references", buffer = ev.buf }
            )
          end

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Display errors" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Display symbol info", buffer = ev.buf })
        end,
      })
    end,
  },
}
