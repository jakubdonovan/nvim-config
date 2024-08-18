return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {
      -- Configuration here, or leave empty to use defaults
      opts = {
        keymaps = {
          insert = { "<C-g>s", desc = "Surround | Insert Mode" },
          insert_line = { "<C-g>S", desc = "Surround | Insert Line Mode" },
          normal = { "ys", desc = "Surround | Normal Mode" },
          normal_cur = { "yss", desc = "Surround | Surround Current Line" },
          normal_line = { "yS", desc = "Surround | Surround Line" },
          normal_cur_line = { "ySS", desc = "Surround | Surround Current Line Entirely" },
          visual = { "S", desc = "Surround | Visual Mode" },
          visual_line = { "gS", desc = "Surround | Visual Line Mode" },
          delete = { "ds", desc = "Surround | Delete Surrounding" },
          change = { "cs", desc = "Surround | Change Surrounding" },
          change_line = { "cS", desc = "Surround | Change Surrounding Line" },
        },
      },
    }
  end,
}
