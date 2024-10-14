-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dark_horizon",

  hl_override = {
    -- NvimTreeRootFolder = { fg = "purple", bg = "NONE" },
    -- NvimTreeNormal = { bg = "black" },
    -- NvimTreeNormalNC = { bg = "black" },
    -- NvimTreeWinSeparator = { bg = "black", fg = "black" },
    LspInlayHint = { bg = "NONE", fg = "grey_fg2" },
    DevIconMd = { fg = "#FFFFFF", bg = "NONE" },
    FloatTitle = { link = "FloatBorder" },
    FloatBorder = { link = "TelescopeBorder" },
    FoldColumn = {
      -- link = "FloatBorder",
      bg = "black",
      fg = "grey_fg2",
    },
    CmpBorder = { link = "FloatBorder" },
    CmpDocBorder = { link = "FloatBorder" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopePromptBorder = { link = "FloatBorder" },
    NeogitDiffContext = { bg = "NONE" },
    NeogitDiffContextHighlight = { bg = "NONE" },
    -- BUG: (types) fg accepts a table
    TbBufOffModified = { fg = { "green", "black", 50 } }, ---@diagnostic disable-line
    ["@comment"] = { link = "Comment" },
    ["@keyword"] = { italic = true },
  },

  hl_add = {
    -- YankVisual = { link = "CursorColumn" },
    -- LspInfoBorder = { link = "FloatBorder" },YankVisual = { bg = "lightbg" },
    YankVisual = { bg = "lightbg" },
    Border = { link = "FloatBorder" },
    LspInfoBorder = { link = "FloatBorder" },
    NvimTreeGitStagedIcon = { fg = "vibrant_green" },
    St_HarpoonInactive = { link = "StText" },
    St_HarpoonActive = { link = "St_LspHints" },
    MarkviewLayer2 = { bg = "#171B21" },
    MarkviewCode = { link = "MarkviewLayer2" },
    HelpviewCode = { link = "MarkviewLayer2" },
    HelpviewInlineCode = { link = "MarkviewInlineCode" },
    HelpviewCodeLanguage = { link = "MarkviewCode" },
    OilFile = { link = "Normal" },
    CodeActionSignHl = { fg = "#F9E2AF" },
    ["@number.luadoc"] = { fg = "Comment" },
    ["@markup.quote.markdown"] = { bg = "NONE" },
    ["@markup.raw.block.markdown"] = { link = "MarkviewLayer2" },
  },
}

M.ui = {

  statusline = {
    theme = "vscode_colored",
    order = {
      "mode",
      "tint",
      "separator",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lspx",
      "separator",
      "cwd",
    },
    modules = {
      separator = function()
        return " "
      end,
      -- Force grey on modules that absorb neighbour colour
      -- (because they don't have a highlight set)
      tint = function()
        return "%#StText#"
      end,

      lspx = function()
        local count = 0
        local display = ""

        if rawget(vim, "lsp") then
          for _, client in ipairs(vim.lsp.get_clients()) do
            if client.attached_buffers[vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)] then
              count = count + 1
              display = (vim.o.columns > 100 and " %#St_Lsp#  LSP ~ " .. client.name .. " ") or " %#St_Lsp#  LSP "
            end
          end
        end

        if count > 1 then
          return " %#St_Lsp#  LSP (" .. count .. ") "
        else
          return display
        end
      end,
    },
  },

  cmp = {
    -- icons_left = true,
    lspkind_text = true,
    style = "atom",
    format_colors = {
      tailwind = true,
      -- icon = "", --any nerdfont icon,
    },
  },
}

M.nvdash = {
  load_on_startup = true,

  -- header = {
  --   "                                 ",
  --   "  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ",
  --   "   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ",
  --   "         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ",
  --   "          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   ",
  --   "         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
  --   "  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ",
  --   " ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  ",
  --   "⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ",
  --   "⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
  --   "     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    ",
  --   "      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ",
  --   "                                 ",
  --   "                                 ",
  -- },

  -- buttons = {
  --   { "  Find File", "Spc f f", "Telescope find_files" },
  --   { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
  --   { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
  --   { "  Bookmarks", "Spc m a", "Telescope marks" },
  --   { "  Themes", "Spc t h", "Telescope themes" },
  --   { "  Mappings", "Spc c h", "NvCheatsheet" },
  -- },
}

M.term = {
  winopts = {
    number = false,
    relativenumber = false,
    winhl = "Normal:floatTermBg,FloatBorder:floatTermBorder",
    stc = "",
  },
  -- sizes = { sp = 0.1, vsp = 0.2, ["bo sp"] = 0.1, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.9,
    height = 0.5,
    border = "single",
  },
}

M.mason = {
  cmd = true,
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "vtsls",
    "prettier",
    "eslint-lsp",
    "svelte-language-server",
    "tailwindcss-language-server",
    "deno",
    -- "ruff-lsp",
  },
}

M.colorify = {
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
