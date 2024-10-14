require "nvchad.options"

local g = {
  dap_virtual_text = true,
  bookmark_sign = "",
  skip_ts_context_commentstring_module = true,
  tabufline_visible = true,
}

local opts = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  -- Folds
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldcolumn = "1",
  foldtext = "",
  foldlevel = 99,
  foldlevelstart = 5,
  foldnestmax = 5,
  fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " },
  -- Prevent issues with some language servers
  backup = false,
  swapfile = false,
  -- Always show minimum n lines after current line
  scrolloff = 10,
  -- True color support
  termguicolors = true,
  -- Line break/wrap behaviours
  wrap = true,
  linebreak = true,
  textwidth = 0,
  wrapmargin = 0,
  -- Indentation values
  tabstop = 2,
  shiftwidth = 0, -- 0 forces same value as tabstop
  expandtab = true,
  autoindent = true,
  cursorline = true,
  cursorlineopt = "both",
  inccommand = "split",
  ignorecase = true,
  updatetime = 100,
  lazyredraw = false,
  iskeyword = vim.opt.iskeyword:append { "_", "@", ".", "-" },
  path = vim.opt.path:append { "**", "lua", "src" },
  emoji = false,
}

for k, v in pairs(g) do
  vim.g[k] = v
end

for k, v in pairs(opts) do
  vim.opt[k] = v
end
