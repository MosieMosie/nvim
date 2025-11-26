return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
      menu = {
        width = math.floor(vim.o.columns * 0.6),
        height = 12,
        border = "rounded",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      print("󱡅 Added to Harpoon")
    end, { desc = "Harpoon: Add file" })

    vim.keymap.set("n", "<leader>r", function()
      harpoon:list():remove()
      print("󱡅 Removed from Harpoon")
    end, { desc = "Harpoon: Remove file" })

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toggle menu" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon: File " .. i })
    end

    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: Previous file" })

    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon: Next file" })

    vim.keymap.set("n", "<leader>hc", function()
      harpoon:list():clear()
      print("󱡅 Cleared all Harpoon marks")
    end, { desc = "Harpoon: Clear all" })
  end,
}
