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

map("n", "<A-S-Left>", "vb", { desc = "Block Word Left" })
map("n", "<A-S-Right>", "vw", { desc = "Block Word Right" })

-- Dari Visual Mode: Teruskan expand seleksi per satu kata
map("v", "<A-S-Left>", "b", { desc = "Extend Block Word Left" })
map("v", "<A-S-Right>", "w", { desc = "Extend Block Word Right" })

map("v", "p", '"_dP', { desc = "Paste tanpa menimpa clipboard" })
map("n", "<leader>bx", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(bufs) do
    -- Hanya hapus buffer yang tidak aktif, valid, dan terdaftar di tabline
    if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all other buffers (tabs)" })
