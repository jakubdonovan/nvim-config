local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { command = "deno", args = { "fmt", "$FILENAME" } },
    html = { command = "deno", args = { "fmt", "$FILENAME" } },
    javascript = { command = "deno", args = { "fmt", "$FILENAME" } },
    typescript = { command = "deno", args = { "fmt", "$FILENAME" } },
    json = { command = "deno", args = { "fmt", "$FILENAME" } },
    jsonc = { command = "deno", args = { "fmt", "$FILENAME" } },
    svelte = {
      command = "deno",
      args = { "fmt", "--unstable-component", "$FILENAME" },
      root_dir = require("lspconfig.util").root_pattern "svelte.config.js",
      --   command = "prettier",
      --   args = { "--plugin", "prettier-plugin-svelte", "$FILENAME" },
      --   root_dir = require("lspconfig.util").root_pattern "svelte.config.js",
    },
    javascriptreact = { command = "deno", args = { "fmt", "$FILENAME" } },
    typescriptreact = { command = "deno", args = { "fmt", "$FILENAME" } },
    markdown = { command = "deno", args = { "fmt", "$FILENAME" } },
  },

  format_on_save = {
    enabled = true,
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
