require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- REMAP COPY, CUT, PASTE, DELETE
-- map({ "n", "v", "i" }, "<C-c>", '"+y', { noremap = true, desc = "copy to system clipboard" })
-- map({ "n", "v", "i" }, "<M-x>", '"+x', { noremap = true, silent = true, desc = "cut and copy to system clipboard" })
-- map({ "n", "v", "i" }, "<M-d>", '"_d', { noremap = true, silent = true, desc = "delete" })
-- map({ "n", "v", "i" }, "<M-v>", '"+p', { noremap = true, silent = true, desc = "paste from system clipboard" })

-- DISABLE CURSOR KEYS
map({ "n", "v", "i" }, "<Left>", "<nop>")
map({ "n", "v", "i" }, "<Right>", "<nop>")
map({ "n", "v", "i" }, "<Up>", "<nop>")
map({ "n", "v", "i" }, "<Down>", "<nop>")

-- SWITCH TABS
-- map({ "n", "v", "i" }, "<C-]>", "gt") -- next
-- map({ "n", "v", "i" }, "<C-[>", "gT") -- prev
-- hello hello hello hello hello
