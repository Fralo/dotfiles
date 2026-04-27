return {
  -- Treesitter for Python-related syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },

  -- LSP configuration for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            pyright = {
              -- Disable pyright's import organizer in favor of ruff
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Enable auto-import suggestions
                autoImportCompletions = true,
                -- Include imports in code actions
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                -- Disable indexing to reduce memory usage
                indexing = false,
                packageIndexDepths = {
                  { name = "rest_framework", depth = 3 },
                  { name = "django", depth = 3 },
                },
              },
            },
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = { logLevel = "error" },
          },
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        ruff = function()
          Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
            -- Disable hover in favor of pyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
      },
    },
  },

}
