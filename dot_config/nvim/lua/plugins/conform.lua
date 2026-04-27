return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- JSON
      opts.formatters_by_ft.json = { "prettier" }

      -- Frontend files: prettier first, then eslint for auto-fixes
      -- Using "eslint" (not eslint_d) to use project-local ESLint v8
      local frontend_formatters = { "prettier", "eslint" }
      opts.formatters_by_ft.javascript = frontend_formatters
      opts.formatters_by_ft.typescript = frontend_formatters
      opts.formatters_by_ft.vue = frontend_formatters

      -- CSS/HTML: prettier only
      opts.formatters_by_ft.css = { "prettier" }
      opts.formatters_by_ft.scss = { "prettier" }
      opts.formatters_by_ft.html = { "prettier" }

      return opts
    end,
  },
}
