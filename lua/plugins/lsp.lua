require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "verible",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").jdtls.setup({
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        maven = {
          enabled = true,  -- Enable Maven support
        },
      },
    },
  },
})

vim.filetype.add({
  extension = {
    v = "verilog",
    sv = "systemverilog",
  },
})

require("lspconfig").verible.setup({
  capabilities = capabilities,
  cmd = { "verible-verilog-ls" },
  filetypes = { "verilog", "systemverilog" },
})
