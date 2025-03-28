-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--
--
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--     })
--
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
return {
  "navarasu/onedark.nvim",
  name = "onedark",
  priority = 1000,

  config = function()
    require("onedark").setup({
      style = "darker",
    })

    vim.cmd.colorscheme("onedark") -- Apply the onedarkpro theme
  end,
}

