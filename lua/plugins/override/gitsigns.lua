---@type NvPluginSpec
return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  opts = {
    signs = {
      -- add = { text = "│" },
      -- change = { text = "│" },
      delete = { text = "󰍵" },
      changedelete = { text = "󱕖" },
      -- topdelete = { text = "‾" },
      -- untracked = { text = "│" },
    },
    -- signs_staged = {
    --   add = { text = "┃" },
    --   change = { text = "┃" },
    --   delete = { text = "_" },
    --   topdelete = { text = "‾" },
    --   changedelete = { text = "~" },
    --   untracked = { text = "┆" },
    -- },
    -- signs_staged_enable = true,
    -- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    -- numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    -- linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    -- word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    -- watch_gitdir = {
    --   follow_files = true,
    -- },
    auto_attach = true,
    attach_to_untracked = true,
    current_line_blame = true,
    -- current_line_blame_opts = {
    --   virt_text = true,
    --   virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    --   delay = 1000,
    --   ignore_whitespace = false,
    --   virt_text_priority = 100,
    -- },
    -- current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    -- sign_priority = 6,
    -- update_debounce = 100,
    -- status_formatter = nil, -- Use default
    -- max_file_length = 40000, -- Disable if file is longer than this (in lines)
    -- preview_config = {
    --   -- Options passed to nvim_open_win
    --   border = "single",
    --   style = "minimal",
    --   relative = "cursor",
    --   row = 0,
    --   col = 1,
    -- },
    on_attach = function(bufnr)
      local gs = require "gitsigns"

      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      local map = vim.keymap.set

      map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
      map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
      map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
    end,
  },
}
-- vim.keymap.set(
--   "n",
--   "<leader>gp",
--   "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
--   { desc = "Gitsigns | Preview Hunk", silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>gj",
--   "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
--   { desc = "Gitsigns | Next Hunk", silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>gk",
--   "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
--   { desc = "Gitsigns | Prev Hunk", silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>gl",
--   "<cmd>lua require 'gitsigns'.blame_line()<cr>",
--   { desc = "Gitsigns | Blame Line", silent = true }
-- )
