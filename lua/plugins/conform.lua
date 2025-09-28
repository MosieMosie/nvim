return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      lua = { "stylua" },
      python = { "black" },
      rust = { "rustfmt" },
    },

    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 3000,
    },
  },
}
