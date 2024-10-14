---@type NvPluginSpec
return {
  "NStefan002/screenkey.nvim",
  cmd = "Screenkey",
  keys = {
    { "<leader>sk", "<cmd>Screenkey<cr>", desc = "Screenkey | Toggle Screenkey", silent = true },
  },
  opts = {
    clear_after = 5,
  },
}
