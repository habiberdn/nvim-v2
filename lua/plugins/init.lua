return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = function()
      return {
        PATH = "prepend",
        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
        max_concurrent_installers = 10,
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", 'dart'
      },
    },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
        },
        lsp = {
          color_rendering = true,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        function()
          require("trouble").toggle("diagnostics")
        end,
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
    config = function()
      require("neoscroll").setup({
        -- Anda bisa membiarkannya kosong untuk pengaturan default yang sudah smooth
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Sembunyikan kursor saat animasi berjalan
        stop_eof = true,             -- Berhenti jika sudah mentok di akhir file
        respect_scrolloff = false,   -- Jalankan animasi tanpa terganggu batas scrolloff
        cursor_scrolls_alone = true, -- Kursor tetap ikut bergerak meskipun layar tidak bisa scroll
        easing = "linear",           -- Jenis animasi: "linear", "sine", "circular", dll.
      })
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy", -- Dimuat di latar belakang setelah Neovim terbuka
    config = function()
      require("smear_cursor").setup({
        -- Anda bisa mengatur seberapa lentur animasinya di sini
        stiffness = 0.6, -- Semakin kecil, semakin elastis efek meluncurnya
        trailing_stiffness = 0.3,
        distance_stop_animating = 0.1,
      })
    end,
  },
  {
    "monkoose/neocodeium",
    event = "InsertEnter",
    config = function()
      require("neocodeium").setup()
    end,
  },

  -- 2. Konfigurasi nvim-cmp (Otak penggabungan tombol TAB)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local neocodeium = require("neocodeium")

      opts.mapping = {
        -- Arrow Down: Navigasi ke bawah di menu Intellisense
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Arrow Up: Navigasi ke atas di menu Intellisense
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Enter (<CR>): Tetap confirm untuk nvim-cmp jika menunya muncul
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),

        -- SUPER TAB: Menangani nvim-cmp, NeoCodeium, dan Indentasi biasa
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- Kondisi A: Jika popup Intellisense muncul, lakukan Confirm
            cmp.confirm({ select = true })
          elseif neocodeium.visible() then
            -- Kondisi B: Jika ada saran AI ghost-text dari NeoCodeium, lakukan Accept
            neocodeium.accept()
          else
            -- Kondisi C: Jika tidak ada apa-apa, berfungsi sebagai Tab/Indentasi normal
            fallback()
          end
        end, { "i", "s" }),

        -- Shift + Tab: Kembalikan ke fungsi indentasi biasa
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
      }
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install'
  },
}
