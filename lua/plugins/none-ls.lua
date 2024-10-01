return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          extra_args = function()
            -- Check if there's a .eslintrc.yaml or .eslintrc.json in the current directory
            local eslint_config = vim.fn.glob(".eslintrc.{json,yaml}")
            if eslint_config ~= "" then
              return { "--config", eslint_config }
            end
            return {}
          end,
        }),
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
