return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "typescript",
      "svelte",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    fold = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  },
}
