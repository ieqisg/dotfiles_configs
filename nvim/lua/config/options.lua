-- ==========================
-- Leader & Basic Settings
-- ==========================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "a:block"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Cursor highlight (red block)
vim.api.nvim_set_hl(0, "Cursor", { bg = "red", fg = "black" })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Cursor", { bg = "red", fg = "black" })
  end,
})

vim.o.updatetime = 250
