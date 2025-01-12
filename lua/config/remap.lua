vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<C-r>", vim.cmd.redo)

vim.keymap.set("n", "<leader>gg", ":Gvdiff<CR>")
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>cc", ":split<CR>")

vim.keymap.set("n", "<leader>ll", "20<C-w><")
vim.keymap.set("n", "<leader>hh", "20<C-w>>")

vim.keymap.set("n", "<leader>kk", "5<C-w>+")
vim.keymap.set("n", "<leader>jj", "5<C-w>-")

