require "nvchad.options"

local opts = {
  termguicolors = true,
  mouse = "",
  cursorline = true,
  cursorlineopt = "both",
  inccommand = "split",
  -- Always show minimum n lines after current line
  scrolloff = 10,
  --Indentation
  autoindent = true,
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " }, -- make EndOfBuffer invisible
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local create_cmd = vim.api.nvim_create_user_command

-- DYNAMIC HYBRID LINE NUMBERS, ABSOLUTE IN INSERT MODE
augroup("numbertoggle", { clear = true })

autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = "numbertoggle",
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = "numbertoggle",
  pattern = "*",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- ENABLE AUTO WRITE
local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

local echo = function(txts)
  vim.api.nvim_echo(txts, false, {})
end

autocmd({ "InsertLeave" }, {
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

autocmd("BufEnter", {
  once = true,
  callback = function()
    if vim.fn.findfile("package.json", vim.fn.getcwd(), ";") ~= "" then
      vim.cmd "AsToggle"
      echo { { "󰆓 ", "LazyProgressDone" }, { "autosave enabled" } }
      clear_cmdarea()
    end
  end,
})

-- ENABLE LUA INLAY HINTS
autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})
