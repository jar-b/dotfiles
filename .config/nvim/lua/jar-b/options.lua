-- Options
vim.opt.termguicolors = true

vim.opt.cursorline = true

vim.opt.clipboard = "unnamedplus"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars:append {
    eol = "↲",
    tab = '» ',
    trail = "·",
}

vim.filetype.add({
    extension = {
        gtpl = 'gotmpl',
        hcl = 'terraform',
    },
})
