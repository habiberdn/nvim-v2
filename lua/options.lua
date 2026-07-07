require "nvchad.options"
vim.opt.laststatus = 3

local opt = vim.opt
opt.wrap = true

-- Memastikan baris dipotong berdasarkan kata (tidak memotong string/variabel di tengah huruf)
opt.linebreak = true

-- Membuat baris lanjutan mengikuti indentasi baris asalnya agar rapi
opt.breakindent = true

-- Opsional: Menambahkan karakter penanda di awal baris lanjutan
opt.showbreak = "↳ "
-- vim.opt.winbar = "%{%v:lua.require'barbecue.ui'.get_navic()%}"
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
