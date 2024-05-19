return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter", -- Load on buffer read, you can specify more specific events or file types
  after = "nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
