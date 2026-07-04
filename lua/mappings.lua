require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-Right>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move tab right" })

-- Pindah posisi tab ke kiri pakai Shift + Panah Kiri
map("n", "<A-Left>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move tab left" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "<C-H>", "<C-w>", { desc = "Hapus satu kata ke belakang" })
map("i", "<C-Bs>", "<C-w>", { desc = "Hapus satu kata ke belakang" })

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window/Pane Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window/Pane Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window/Pane Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window/Pane Right" })
