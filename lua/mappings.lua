require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "jk", "<ESC>")

-- DISABLE CURSOR KEYS
map({ "n", "v", "i" }, "<Left>", "<nop>")
map({ "n", "v", "i" }, "<Right>", "<nop>")
map({ "n", "v", "i" }, "<Up>", "<nop>")
map({ "n", "v", "i" }, "<Down>", "<nop>")

-- SWITCH TABS
-- map({ "n", "v", "i" }, "<C-]>", "gt") -- next
-- map({ "n", "v", "i" }, "<C-[>", "gT") -- prev

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    hl = "Normal:floatTermBg,FloatBorder:floatTermBorder",
  }
end, { desc = "terminal toggle floating term" })

map({ "n" }, "<leader>th", function()
  require("nvchad.themes").open { icon = " " }
end, { desc = "open theme picker" })

--nvchad/menu
map({ "n" }, "<C-t>", function()
  require("menu").open "default"
end, { desc = "open menu" })

map({ "n" }, "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- WARP SHIFT-TAB WORKAROUND
map({ "n" }, "<c-Y>", require("nvchad.tabufline").prev)
