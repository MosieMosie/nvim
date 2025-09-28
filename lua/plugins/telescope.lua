return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "package%-lock%.json", "%.json", "%.yml" },
          mappings = {
            n = {
              ["<C-c>"] = actions.close,
            },
            i = {
              ["<C-q>"] = actions.send_to_qflist,
            },
          },
        },
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })

      telescope.load_extension("ui-select")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
}
