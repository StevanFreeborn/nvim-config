vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding"
	.. "=[System.Text.Encoding]::UTF8;$PSStyle.Formatting.Error = '';$PSStyle.Formatting.ErrorAccent = '';"
	.. "$PSStyle.Formatting.Warning = '';$PSStyle.OutputRendering = 'PlainText';"
vim.opt.shellredir = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding utf8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

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
	},
})

-- if i am in insert mode and i spam one of these keys
-- i probably want to escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "hh", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "lll", "<Esc>", { desc = "Escape" })
