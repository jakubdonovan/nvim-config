local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local create_cmd = vim.api.nvim_create_user_command

-- DYNAMIC HYBRID LINE NUMBERS, ABSOLUTE IN INSERT MODE
vim.wo.rnu = true
autocmd({ "InsertEnter", "InsertLeave" }, {
  callback = function(args)
    if vim.bo.buflisted then
      vim.wo.rnu = args.event == "InsertLeave"
    end
  end,
})

-- ENABLE LUA INLAY HINTS
autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})

--DENO
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

-- RESTORE CURSOR POSITION ON FILE OPEN
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- REDRAW STATUSLINE
autocmd("LspAttach", {
  desc = "Redraw statusline on attaching lsp.",
  pattern = "*",
  group = augroup("RedrawStatusline", { clear = true }),
  callback = function()
    vim.cmd "redrawstatus"
  end,
})
