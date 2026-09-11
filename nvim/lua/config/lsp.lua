-- ==========================
-- LSP Setup
-- ==========================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "tailwindcss", "pyright" },
  automatic_enable = true,
})

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
      border = "rounded",
      source = "always",
      prefix = "",
    })
  end,
})
