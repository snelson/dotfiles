-- Colorscheme
return {
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("solarized").setup({
        transparent = { enabled = false },
      })
      vim.cmd.colorscheme("solarized")
    end,
  },
}
