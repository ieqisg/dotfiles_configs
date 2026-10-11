local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

-- jdtls is managed by nvim-java.
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "tailwindcss",
    "pyright",
  },
  automatic_enable = true,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

local diagnostic_group =
  vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  group = diagnostic_group,
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = {
        "BufLeave",
        "CursorMoved",
        "InsertEnter",
        "FocusLost",
      },
      border = "rounded",
      source = true,
      prefix = "",
      scope = "cursor",
    })
  end,
})
