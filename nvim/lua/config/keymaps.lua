-- ==========================
-- Keymaps
-- ==========================

vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<C-A-v>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "Toggle terminal 1" })
vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "Toggle terminal 2" })
vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "Toggle terminal 3" })
vim.keymap.set("n", "<leader>t4", "<cmd>4ToggleTerm<CR>", { desc = "Toggle terminal 4" })
vim.keymap.set("n", "<leader>t5", "<cmd>5ToggleTerm<CR>", { desc = "Toggle terminal 5" })
vim.keymap.set("n", "<leader>t6", "<cmd>6ToggleTerm<CR>", { desc = "Toggle terminal 6" })
vim.keymap.set("n", "<leader>t7", "<cmd>7ToggleTerm<CR>", { desc = "Toggle terminal 7" })

-- Use Alt + Arrow Keys to move between splits
vim.keymap.set("n", "<A-Left>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-Right>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<A-Up>", "<C-w>k", { desc = "Move to upper split" })
vim.keymap.set("n", "<A-Down>", "<C-w>j", { desc = "Move to lower split" })

-- Cycle buffers like VS Code tabs
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { silent = true })

-- Go to specific buffer (tab)
vim.keymap.set("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", { silent = true })
vim.keymap.set("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", { silent = true })
vim.keymap.set("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", { silent = true })
vim.keymap.set("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", { silent = true })
vim.keymap.set("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", { silent = true })
vim.keymap.set("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", { silent = true })
vim.keymap.set("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", { silent = true })
vim.keymap.set("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", { silent = true })
vim.keymap.set("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", { silent = true })

vim.keymap.set("n", "<A-w>", "<cmd>bd<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<C-h>", ":%s/")
vim.keymap.set("n", "<C-a>", "^", { desc = "Move to start of text on line" })
