return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,

    config = function()
      require("onedark").setup({
        style = "darker",
      })

      vim.cmd.colorscheme("onedark")
    end,
  },
  -- the super cool buffer line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula",
        },
      })
    end,
  },
}
