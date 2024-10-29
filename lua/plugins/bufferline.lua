return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			-- options = {
			-- 	diagnostics = "nvim_lsp",
			-- 	offsets = {
			-- 		{
			-- 			filetype = "neo-tree",
			-- 			text = "File Explorer",
			-- 			highlight = "Directory",
			-- 			separator = true,
			-- 		},
			-- 	},
			-- },
		})

		vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
	end,
}
