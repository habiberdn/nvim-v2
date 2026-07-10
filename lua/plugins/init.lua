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
        "html", "css", "javascript", "typescript", "tsx",
        "php", "blade", 'dart', 'python', -- Catatan: Typo 'phyton' sudah diperbaiki ke 'python'
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
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing = "linear",
      })
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    config = function()
      require("smear_cursor").setup({
        stiffness = 0.6,
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

  -- 2. Konfigurasi nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local neocodeium = require("neocodeium")

      opts.mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif neocodeium.visible() then
            neocodeium.accept()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "dist/",
            "build/",
            "target/"
          },
          preview = {
            filesize_limit = 0.1,
            timeout = 250,
          },
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

}
