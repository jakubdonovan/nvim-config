require "nvchad.options"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
--#region

-- DYNAMIC HYBRID LINE NUMBERS, ABSOLUTE IN INSERT MODE
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = "numbertoggle",
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = "numbertoggle",
  pattern = "*",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- DISABLE MOUSE
vim.opt.mouse = ""

-- ENABLE AUTO WRITE
local create_cmd = vim.api.nvim_create_user_command

local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

local echo = function(txts)
  vim.api.nvim_echo(txts, false, {})
end

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  nested = true,
  callback = function()
    if vim.g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd "silent w"

      echo { { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. os.date "%I:%M %p" } }

      clear_cmdarea()
    end
  end,
})

create_cmd("AsToggle", function()
  vim.g.autosave = not vim.g.autosave

  local enabledTxt = { { "󰆓 ", "LazyProgressDone" }, { "autosave enabled!" } }
  local disabledTxt = { { " ", "LazyNoCond" }, { "autosave disabled" } }

  echo(vim.g.autosave and enabledTxt or disabledTxt)

  clear_cmdarea()
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
  once = true,
  callback = function()
    if vim.fn.findfile("package.json", vim.fn.getcwd(), ";") ~= "" then
      vim.cmd "AsToggle"
      echo { { "󰆓 ", "LazyProgressDone" }, { "autosave enabled" } }
      clear_cmdarea()
    end
  end,
})

--#INDENT GUIDES
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
