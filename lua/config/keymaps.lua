vim.g.mapleader = " "

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected line down one
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected line up one

vim.keymap.set("n", "Q", "<nop>")
