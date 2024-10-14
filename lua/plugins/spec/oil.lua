---@type NvPluginSpec
return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  cmd = "Oil",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
  },
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    watch_for_changes = true,
    cleanup_delay_ms = 0,

    win_options = {
      winbar = "%!v:lua.get_oil_winbar()",
    },
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    -- float = {
    --   padding = 2,
    --   max_height = math.ceil(vim.o.lines * 0.8 - 4),
    --   max_width = math.ceil(vim.o.columns * 0.4),
    --   border = "rounded",
    --   win_options = {
    --     wrap = true,
    --     winblend = 0,
    --   },
    --   -- This is the config that will be passed to nvim_open_win.
    --   -- Change values here to customize the layout
    --   override = function(conf)
    --     return conf
    --   end,
    -- },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = false,
      ["q"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
  config = function(_, opts)
    local util = require "oil.util"

    _G.get_oil_winbar = function()
      local dir = require("oil").get_current_dir()
      if dir then
        return "%#OilWinbar#" .. vim.fn.fnamemodify(dir, ":~")
      else
        return "%#OilWinbar#" .. vim.api.nvim_buf_get_name(0)
      end
    end

    require("oil").setup(opts)
  end,
}
