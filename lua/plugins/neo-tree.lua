return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
    vim.keymap.set("n", "<C-a>", ":Neotree focus<CR>", {})

    require("neo-tree").setup({
      filesystem = {
        window = {
          mappings = {
            ["<esc>"] = "clear_filter",
          },
          fuzzy_finder_mappings = {
            ["<esc>"] = "close_keep_filter",
          },
        },
      },
    })
  end,
}
