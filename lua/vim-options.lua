vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set shell=pwsh")
vim.cmd("set shellcmdflag=-Command")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.wrap = false
vim.opt.shadafile = "NONE"
vim.opt.foldlevelstart = 99

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<leader>ww", ":set wrap!<CR>", { desc = "Toggle word wrap" })

vim.filetype.add({
  extension = {
    props = "xml",
  }
})

-- if i am in insert mode and i spam one of these keys
-- i probably want to escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "hh", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "lll", "<Esc>", { desc = "Escape" })
