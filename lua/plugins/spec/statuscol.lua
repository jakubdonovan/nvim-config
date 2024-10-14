---@type NvPluginSpec
return {
  "luukvbaal/statuscol.nvim",
  event = "VeryLazy",
  config = function()
    local builtin = require "statuscol.builtin"
    require("statuscol").setup {
      bt_ignore = { "terminal", "nofile", "NeogitStatus" },
      relculright = true,
      segments = {
        { text = { "%s" }, foldclosed = true, click = "v:lua.ScSa" },
        {
          text = { builtin.foldfunc, "  " },
          condition = { builtin.not_empty, true, builtin.not_empty },
          foldclosed = true,
          click = "v:lua.ScFa",
        },
        { text = { builtin.lnumfunc, " " }, foldclosed = true, click = "v:lua.ScLa" },
      },
    }
  end,
}
