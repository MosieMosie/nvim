vim.keymap.set("n", "<leader>h", ":bn <CR>")
vim.keymap.set("n", "<leader>l", ":bp <CR>")
vim.keymap.set("n", "<leader>j", ":bd <CR>")

vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
