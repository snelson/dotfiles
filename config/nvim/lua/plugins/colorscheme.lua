-- Colorscheme
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = true,
          mason = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
