return {
  "lukas-reineke/indent-blankline.nvim",
  name = "indent_blankline",
  event = { "BufReadPost", "BufNewfile" },
  config = function()
    dofile(vim.g.base46_cache .. "blankline")

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    require("ibl").setup {
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        show_exact_scope = true,
      },
    }

    dofile(vim.g.base46_cache .. "blankline")
  end,
}
