return {
  -- ==========================
  -- Treesitter + autotag
  -- ==========================

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local ok, treesitter = pcall(require, "nvim-treesitter")

      if not ok then
        vim.notify(
          "nvim-treesitter failed to load",
          vim.log.levels.ERROR
        )
        return
      end

      treesitter.setup()

      local parsers = {
        "css",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "php",
        "svelte",
        "tsx",
        "typescript",
        "vue",
        "xml",
      }

      if treesitter.install then
        treesitter.install(parsers)
      else
        vim.notify(
          "Run :TSUpdate and restart Neovim",
          vim.log.levels.WARN
        )
      end

      local treesitter_group =
          vim.api.nvim_create_augroup("TreesitterFtSetup", {
            clear = true,
          })

      vim.api.nvim_create_autocmd("FileType", {
        group = treesitter_group,
        pattern = parsers,
        callback = function(args)
          local started = pcall(vim.treesitter.start, args.buf)

          if started then
            vim.bo[args.buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  -- Highlight matching tags
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
  },

  -- ==========================
  -- Moonlight colorscheme
  -- ==========================

  {
    "shaunsingh/moonlight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonlight_italic_comments = true
      vim.g.moonlight_italic_keywords = false
      vim.g.moonlight_italic_functions = false
      vim.g.moonlight_italic_variables = false
      vim.g.moonlight_contrast = true
      vim.g.moonlight_borders = false
      vim.g.moonlight_disable_background = true

      require("moonlight").set()

      local function custom_highlights()
        local set = vim.api.nvim_set_hl

        set(0, "CursorLine", {
          bg = "#1c1e2b",
        })

        set(0, "LineNr", {
          fg = "#6b7089",
        })

        set(0, "CursorLineNr", {
          fg = "#89b4fa",
          bold = true,
        })

        set(0, "Visual", {
          bg = "#3a3f5c",
        })

        set(0, "Cursor", {
          bg = "#5de4c7",
          fg = "#1c1e2b",
        })

        set(0, "Comment", {
          fg = "#a6accd",
          italic = true,
        })

        set(0, "Keyword", {
          fg = "#c792ea",
          bold = true,
        })

        set(0, "Function", {
          fg = "#82aaff",
          bold = true,
        })

        set(0, "@function.call", {
          fg = "#c792ea",
        })

        set(0, "@method", {
          fg = "#82aaff",
        })

        set(0, "String", {
          fg = "#9ece6a",
        })

        set(0, "@variable", {
          fg = "#ffcb6b",
        })

        set(0, "@variable.builtin", {
          fg = "#5de4c7",
          bold = true,
        })

        set(0, "@parameter", {
          fg = "#f78c6c",
        })

        set(0, "@field", {
          fg = "#7dcfff",
        })

        set(0, "@property", {
          fg = "#7dcfff",
        })

        set(0, "@constant", {
          fg = "#f7768e",
          bold = true,
        })

        set(0, "@boolean", {
          fg = "#c792ea",
          bold = true,
        })

        set(0, "@number", {
          fg = "#f5a97f",
        })

        set(0, "@operator", {
          fg = "#89b4fa",
        })

        set(0, "@type", {
          fg = "#5de4c7",
          bold = true,
        })

        set(0, "@type.builtin", {
          fg = "#82aaff",
          italic = true,
        })

        set(0, "@type.definition", {
          fg = "#c792ea",
          bold = true,
        })
      end

      custom_highlights()

      local colorscheme_group =
          vim.api.nvim_create_augroup("MoonlightHighlights", {
            clear = true,
          })

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = colorscheme_group,
        pattern = "moonlight",
        callback = custom_highlights,
      })
    end,
  },

  -- ==========================
  -- Terminal
  -- ==========================

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = {
          border = "rounded",
        },
      })
    end,
  },

  -- ==========================
  -- Comments
  -- ==========================

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      })
    end,
  },

  -- ==========================
  -- Indent guides
  -- ==========================

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
      })
    end,
  },

  -- ==========================
  -- File explorer
  -- ==========================

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({})

      vim.keymap.set(
        "n",
        "<leader>e",
        "<cmd>Neotree toggle<CR>",
        {
          silent = true,
          desc = "Toggle file explorer",
        }
      )
    end,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- ==========================
  -- Buffer tabs
  -- ==========================

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          color_icons = true,
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        },
      })
    end,
  },

  -- ==========================
  -- Telescope
  -- ==========================

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set(
        "n",
        "<leader>ff",
        builtin.find_files,
        { desc = "Find files" }
      )

      vim.keymap.set(
        "n",
        "<leader>fg",
        builtin.live_grep,
        { desc = "Live grep" }
      )

      vim.keymap.set(
        "n",
        "<leader>fb",
        builtin.buffers,
        { desc = "Find buffers" }
      )
    end,
  },

  -- ==========================
  -- Mason and LSP
  -- ==========================

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
  },

  -- ==========================
  -- Java
  -- ==========================

  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("java").setup({
        jdk = {
          auto_install = false,
          path = "/usr/lib/jvm/java-21-openjdk",
        },
      })

      vim.lsp.config("jdtls", {
        capabilities =
            require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.enable("jdtls")
    end,
  },
  -- ==========================
  -- Autocompletion
  -- ==========================

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),

          ["<Tab>"] = cmp.mapping.select_next_item(),

          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),

        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
          },
          {
            name = "path",
          },
          {
            name = "buffer",
          },
        }),
      })
    end,
  },

  -- ==========================
  -- Autopairs
  -- ==========================

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,
        enable_check_bracket_line = true,
        map_cr = true,
      })

      local cmp = require("cmp")
      local cmp_autopairs =
          require("nvim-autopairs.completion.cmp")

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  -- ==========================
  -- Formatting
  -- ==========================

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
        },

        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
