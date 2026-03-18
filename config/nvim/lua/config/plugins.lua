return {

  -- utility
  { "nvim-lua/plenary.nvim" },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- statusline
  { "nvim-lualine/lualine.nvim" },

  -- dashboard
  { "nvimdev/dashboard-nvim" },

  -- git signs
 {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    local gs = require("gitsigns")

    vim.keymap.set("n", "]h", gs.next_hunk)
    vim.keymap.set("n", "[h", gs.prev_hunk)

    vim.keymap.set("n", "<leader>hs", gs.stage_hunk)
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk)

    vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
    vim.keymap.set("n", "<leader>hb", gs.blame_line)
  end,
},
  -- harpoon
  { "ThePrimeagen/harpoon" },

  -- mason (tool installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason lsp bridge
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP config
{
  "neovim/nvim-lspconfig",
  config = function()

    -- LSP servers
    vim.lsp.config("pyright", {})
    vim.lsp.config("bashls", {})
    vim.lsp.config("lua_ls", {})
    vim.lsp.config("gopls", {})

    vim.lsp.enable("pyright")
    vim.lsp.enable("bashls")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("gopls")

    -- Diagnostics UI
    vim.diagnostic.config({
      virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
      },
    })

    -- Format Go files on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- Telescope LSP helpers
    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "gd", telescope.lsp_definitions)
    vim.keymap.set("n", "gr", telescope.lsp_references)
    vim.keymap.set("n", "gi", telescope.lsp_implementations)
    vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols)
    vim.keymap.set("n", "<leader>ws", telescope.lsp_workspace_symbols)
    vim.keymap.set("n", "<leader>e", telescope.diagnostics)

    -- Diagnostics navigation
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

    -- LSP actions
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

    -- Go shortcuts
    vim.keymap.set("n", "<leader>gr", function()
      vim.cmd("!go run %")
    end)

    vim.keymap.set("n", "<leader>gt", function()
      vim.cmd("!go test ./...")
    end)

  end,
},

  -- completion engine
  {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
  completion = {
  autocomplete = {
    require("cmp.types").cmp.TriggerEvent.TextChanged,
  },
  keyword_length = 2,
},
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})  end,
},
  -- completion sources
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- formatter
  { "stevearc/conform.nvim" },

  -- telescope
  { "nvim-telescope/telescope.nvim" ,
   dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- file explorer
  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
   },
  },


  -- flash
  {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {}
  },
}
