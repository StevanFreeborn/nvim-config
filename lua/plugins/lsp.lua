return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_enable = false,
      auto_install = true,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    keys = {
      { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
    opts = {
      search = {},
      options = {},
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hoffs/omnisharp-extended-lsp.nvim" },
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)

        local lvl = ({
          ERROR = vim.log.levels.ERROR,
          WARNING = vim.log.levels.WARN,
          INFO = vim.log.levels.INFO,
          LOG = vim.log.levels.DEBUG,
        })[result.type]

        vim.notify(result.message, lvl, {
          title = string.format("LSP[%s]", client and client.name or "Unknown"),
        })
      end

      vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)

        if result.value.kind == "begin" then
          vim.notify(
            string.format("LSP[%s] %s", client and client.name or "Unknown", result.value.title),
            vim.log.levels.INFO
          )
        end
      end

      vim.lsp.config("eslint", {
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

      vim.lsp.enable("eslint")

      local omnisharpCommand = vim.fn.stdpath("data") .. "/mason/bin/OmniSharp.cmd"

      vim.lsp.config("omnisharp", {
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").handler,
        },
        cmd = { omnisharpCommand },
        capabilities = capabilities,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            DocumentAnalysisTimeoutMs = 30000,
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
          },
          Sdk = {
            IncludePrereleases = true,
          },
        },
        root_markers = { '.git' },
      })

      vim.lsp.enable("omnisharp")

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")

      local vue_language_server = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server,
              languages = { "vue" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      vim.lsp.enable("ts_ls")

      vim.lsp.config("html", {
        filetypes = { "html", "ejs", "vue" },
        capabilities = capabilities,
      })

      vim.lsp.enable("html")

      vim.lsp.config("emmet_language_server", {
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue" },
        capabilities = capabilities,
      })

      vim.lsp.enable("emmet_language_server")

      vim.lsp.config("cssls", {
        filetypes = { "css", "vue", "scss", "less" },
        capabilities = capabilities,
      })

      vim.lsp.enable("cssls")

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.enable("tailwindcss")

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.enable("pyright")

      vim.lsp.config("lemminx", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lemminx")

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("gopls")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          if not client then
            vim.notify("LSP client not found", vim.log.levels.ERROR)
            return
          end

          if not client.server_capabilities then
            vim.notify("LSP server not ready yet", vim.log.levels.WARN)
            return
          end

          client.on_error = function(err)
            vim.notify(string.format("LSP server error: %s", err.message), vim.log.levels.ERROR)
          end

          client.on_status = function(status)
            if status == "stopped" then
              vim.notify("LSP server stopped", vim.log.levels.WARN)
            elseif status == "running" then
              vim.notify("LSP server running", vim.log.levels.INFO)
            end
          end

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

          vim.api.nvim_create_autocmd({ "FileType" }, {
            callback = function()
              -- check if treesitter has parser
              if require("nvim-treesitter.parsers").has_parser() then
                -- use treesitter folding
                vim.opt.foldmethod = "expr"
                vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
              else
                -- use alternative foldmethod
                vim.opt.foldmethod = "syntax"
              end
            end,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              -- buf_request_sync defaults to a 1000ms timeout. Depending on your
              -- machine and codebase, you may want longer. Add an additional
              -- argument after params if you find that you have to write the file
              -- twice for changes to be saved.
              -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
              for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                  end
                end
              end
              vim.lsp.buf.format({ async = false })
            end,
          })

          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            { desc = "Code actions", buffer = ev.buf }
          )

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
          vim.keymap.set(
            "n",
            "<leader>e",
            vim.diagnostic.open_float,
            { desc = "Display error for current line", buffer = ev.buf }
          )
          vim.keymap.set(
            "n",
            "<leader>ea",
            ":Telescope diagnostics bufnr=0<CR>",
            { desc = "Display errors for current buffer", buffer = ev.buf }
          )
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Display symbol info", buffer = ev.buf })
        end,
      })
    end,
  },
}
