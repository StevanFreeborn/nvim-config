vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set shell=pwsh")
vim.cmd("let &shellcmdflag = '-NoLogo'")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.wrap = false

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
