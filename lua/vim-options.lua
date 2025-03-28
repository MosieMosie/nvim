vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>h", ":bn <CR>")
vim.keymap.set("n", "<leader>l", ":bp <CR>")
vim.keymap.set("n", "<leader>j", ":bd <CR>")

vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })

