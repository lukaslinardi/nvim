vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<C-r>", vim.cmd.redo)

vim.keymap.set("n", "<leader>gg", ":Gvdiff<CR>")
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>hh", ":split<CR>")

vim.keymap.set("n", "<C-<>", "20<C-w><")
vim.keymap.set("n", "<C->>", "20<C-w>>")

vim.keymap.set("n", "<leader>hi", "5<C-w>+")
vim.keymap.set("n", "<leader>hd", "5<C-w>-")

