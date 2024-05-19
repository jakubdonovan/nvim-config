return {
  "lukas-reineke/indent-blankline.nvim",
  name = "indent_blankline",
  event = { "BufReadPost", "BufNewfile" },
  config = function()
    local highlight = {
      "Alpha10",
      "Alpha20",
      "Alpha30",
      "Alpha40",
      "Alpha50",
      "Alpha60",
      "Alpha70",
      "Alpha80",
      "Alpha90",
      "Alpha100",
    }

    require("ibl").setup {
      indent = {
        char = "│",
        highlight = highlight,
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        show_exact_scope = true,
      },
      -- show_current_context = true,
      -- show_current_context_start = true,
      -- show_end_of_line = true,
    }

    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Alpha10", { fg = "#1a1a1a" }) -- Dark grey, almost black
      vim.api.nvim_set_hl(0, "Alpha20", { fg = "#333333" }) -- Dark grey
      vim.api.nvim_set_hl(0, "Alpha30", { fg = "#4d4d4d" }) -- Medium dark grey
      vim.api.nvim_set_hl(0, "Alpha40", { fg = "#666666" }) -- Medium grey
      vim.api.nvim_set_hl(0, "Alpha50", { fg = "#808080" }) -- True medium grey
      vim.api.nvim_set_hl(0, "Alpha60", { fg = "#999999" }) -- Medium light grey
      vim.api.nvim_set_hl(0, "Alpha70", { fg = "#b3b3b3" }) -- Light grey
      vim.api.nvim_set_hl(0, "Alpha80", { fg = "#cccccc" }) -- Very light grey
      vim.api.nvim_set_hl(0, "Alpha90", { fg = "#e6e6e6" }) -- Very very light grey
      vim.api.nvim_set_hl(0, "Alpha100", { fg = "#ffffff" }) -- White
    end)
  end,
}
