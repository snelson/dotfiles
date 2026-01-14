-- Ruby/Rails development plugins
return {
  -- vim-rails (still excellent, no Lua replacement)
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
  },

  -- vim-ruby
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "eruby" },
  },

  -- vim-bundler
  {
    "tpope/vim-bundler",
    ft = { "ruby" },
  },

  -- Test runner (vim-test replaces vim-rspec with more language support)
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
      -- Legacy mappings for muscle memory
      { "<leader>t", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>s", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>l", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<leader>a", "<cmd>TestSuite<cr>", desc = "Test suite" },
    },
    config = function()
      -- Use tmux to run tests
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#start_normal"] = 1

      -- Ruby settings
      vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
      vim.g["test#ruby#use_spring_binstub"] = 1
    end,
  },

  -- Ruby text objects
  {
    "nelstrom/vim-textobj-rubyblock",
    ft = { "ruby", "eruby" },
    dependencies = { "kana/vim-textobj-user" },
  },
}
