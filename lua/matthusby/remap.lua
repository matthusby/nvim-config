vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J will keep cursor at the same place when combining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep search terms centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- I do not want to be in Q land
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile)

vim.keymap.set("n", "<D-[>", vim.cmd.bprev)
vim.keymap.set("n", "<D-]>", vim.cmd.bnext)

vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
vim.keymap.set("n", "<D-w>", vim.cmd.bd)

vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float)
