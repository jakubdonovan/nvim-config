return {
  "stevearc/conform.nvim",
  -- Activate formatting on save by setting up an autocmd within the plugin configuration
  event = "BufWritePre",
  config = function()
    require "configs.conform"
  end,
}
