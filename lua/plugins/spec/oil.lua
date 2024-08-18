---@type NvPluginSpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  init = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil | Open Oil" })
  end,
  cmd = "Oil",
  opts = {
    default_file_explorer = true,
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 2,
      max_height = math.ceil(vim.o.lines * 0.8 - 4),
      max_width = math.ceil(vim.o.columns * 0.4),
      border = "rounded",
      win_options = {
        wrap = true,
        winblend = 0,
      },
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,

      keymaps = {
        ["g?"] = { action = "actions.show_help", desc = "Oil | Show Help" },
        ["<CR>"] = { action = "actions.select", desc = "Oil | Select" },
        ["<C-s>"] = { action = "actions.select_vsplit", desc = "Oil | Vertical Split" },
        ["<C-h>"] = { action = "actions.select_split", desc = "Oil | Horizontal Split" },
        ["<C-t>"] = { action = "actions.select_tab", desc = "Oil | Open in Tab" },
        ["<C-p>"] = { action = "actions.preview", desc = "Oil | Preview" },
        ["<C-c>"] = { action = "actions.close", desc = "Oil | Close" },
        ["<C-l>"] = { action = "actions.refresh", desc = "Oil | Refresh" },
        ["-"] = { action = "actions.parent", desc = "Oil | Open Parent Directory" },
        ["_"] = { action = "actions.open_cwd", desc = "Oil | Open Current Working Directory" },
        ["`"] = { action = "actions.cd", desc = "Oil | :cd to Current Directory" },
        ["~"] = { action = "actions.tcd", desc = "Oil | :tcd to Current Directory" },
        ["gs"] = { action = "actions.change_sort", desc = "Oil | Change Sort" },
        ["gx"] = { action = "actions.open_external", desc = "Oil | Open External" },
        ["g."] = { action = "actions.toggle_hidden", desc = "Oil | Toggle Hidden Files" },
        ["g\\"] = { action = "actions.toggle_trash", desc = "Oil | Toggle Trash" },
      },
    },
  },
}
