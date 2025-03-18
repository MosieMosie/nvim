return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylelint,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black
			},
		})

		vim.diagnostic.config({
			underline = true,
			signs = true,
			virtual_text = false,
			float = {
				header = false,
				source = "if_any",
				border = "rounded",
				focusable = false,
			},
			update_in_insert = false,
			severity_sort = true,
		})

		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end, { desc = "Toggle diagnostics" })

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
