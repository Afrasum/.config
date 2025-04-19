require("afras.core")
require("afras.lazy")

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↪ "
vim.keymap.set("n", "<leader>z", "<cmd>set wrap! linebreak!<CR>")
