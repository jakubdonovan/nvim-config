local lspconfig = require "lspconfig"
local lspconfigConfigs = require "lspconfig.configs"
local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  tailwindcss = {
    root_dir = lspconfig.util.root_pattern "tailwind.config.ts",
    filetypes = { "svelte", "html", "javascriptreact", "typescriptreact" },
  },

  -- eslint = {},
  -- vtsls = {
  --   cmd = { "bunx", "--bun", "vtsls", "--stdio" },
  --   root_dir = lspconfig.util.root_pattern "package.json",
  --   filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  --   single_file_support = false,
  --   settings = {
  --     javascript = {
  --       preferences = { useAliasesForRenames = true },
  --       inlayHints = {
  --         enumMemberValues = { enabled = true },
  --         functionLikeReturnTypes = { enabled = true },
  --         parameterNames = { enabled = "all" },
  --         parameterTypes = { enabled = true },
  --         propertyDeclarationTypes = { enabled = true },
  --         variableTypes = { enabled = false },
  --       },
  --     },
  --     typescript = {
  --
  --       preferences = { includePackageJsonAutoImports = "auto", useAliasesForRenames = true },
  --       inlayHints = {
  --         enumMemberValues = { enabled = true },
  --         functionLikeReturnTypes = { enabled = true },
  --         parameterNames = { enabled = "all" },
  --         parameterTypes = { enabled = false },
  --         propertyDeclarationTypes = { enabled = false },
  --         variableTypes = { enabled = false },
  --       },
  --     },
  --     vtsls = {
  --       experimental = {
  --         maxInlayHintLength = 40,
  --       },
  --     },
  --   },
  -- },
  denols = {
    root_dir = lspconfig.util.root_pattern("package.json", "deno.json", "deno.jsonc, tsconfig.json"),
    -- single_file_support = false,
    flags = {
      debounce_text_changes = 150,
    },
    filetypes = {
      "javascript",
      "javascript.jsx",
      "javascriptreact",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
      "markdown",
    },
    settings = {
      javascript = {
        inlayHints = {
          parameterNames = { enabled = "none", suppressWhenArgumentMatchesName = true },
          parameterTypes = { enabled = false },
          variableTypes = { enabled = false, suppressWhenTypeMatchesName = true },
          propertyDeclarationTypes = { enabled = false },
          functionLikeReturnTypes = { enabled = false },
          enumMemberValues = { enabled = false },
        },
      },
      typescript = {
        inlayHints = {
          parameterNames = { enabled = "none", suppressWhenArgumentMatchesName = true },
          parameterTypes = { enabled = false },
          variableTypes = { enabled = false, suppressWhenTypeMatchesName = true },
          propertyDeclarationTypes = { enabled = false },
          functionLikeReturnTypes = { enabled = false },
          enumMemberValues = { enabled = false },
        },
      },
      deno = {
        enable = true,
        lint = true,
        -- config = './deno.jsonc',
        -- disabledPaths = []
        -- unstable = { "sloppy-imports" },
        suggest = {
          names = true,
          paths = true,
          completeFunctionCalls = false,
          autoImports = true,
          imports = {
            autoDiscover = true,
            hosts = {
              ["https://deno.land"] = true,
            },
          },
        },
      },
    },
  },
  svelte = {
    root_dir = lspconfig.util.root_pattern "svelte.config.js",
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "all" },
          parameterTypes = { enabled = false },
          propertyDeclarationTypes = { enabled = false },
          variableTypes = { enabled = false },
        },
      },
    },
  },
  marksman = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

lspconfigConfigs.pylance = {
  default_config = {
    cmd = { "bunx", "--bun", "delance-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = lspconfig.util.root_pattern "pyproject.toml",
    single_file_support = true,
    settings = {
      python = {
        pythonPath = vim.fn.exepath "python",
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
          -- stubPath = vim.fn.stdpath "data" .. "/python_stubs",
          inlayHints = {
            variableTypes = true,
            functionReturnTypes = true,
            parameterNames = {
              enabled = true,
              suppressWhenArgumentMatchesName = true,
            },
          },
        },
      },
    },
  },
}

lspconfig.pylance.setup {
  on_init = configs.on_init,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
}

-- PREVENTS ALL DIAGNOSTICS FROM DISPLAYING IN BUFFER
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { border = "rounded" },
}
