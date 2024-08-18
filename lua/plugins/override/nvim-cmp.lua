return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function()
    local cmp = require "cmp"
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  config = function(_, opts)
    table.insert(opts.sources, 2, { name = "codeium" })
    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
    })

    local luasnip = require "luasnip"
    luasnip.filetype_extend("svelte", { "html" })
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect
    require("cmp").setup(opts)
  end,
  dependencies = {
    {
      "hrsh7th/cmp-cmdline", -- Commandline completions
    },
    {
      "Exafunction/codeium.nvim", -- AI Autocomplete
      opts = {},
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
    },
  },
}
