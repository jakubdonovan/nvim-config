local options = {
  formatters = {
    svelte_fmt = {
      command = "prettier",
      args = { "--plugin", "prettier-plugin-svelte", "$FILENAME" },
    },
  },

  formatters_by_ft = {
    lua = { { "stylua" } },
    css = { { "prettier" } },
    html = { { "prettier" } },
    javascript = { { "prettier" } },
    typescript = { { "prettier" } },
    json = { { "prettier" } },
    jsonc = { { "prettier" } },
    svelte = { "svelte_fmt" },
  },

  format_on_save = {
    enabled = true,
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
