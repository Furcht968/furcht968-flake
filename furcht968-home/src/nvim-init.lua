local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local wombat = {
  normal = {
    a = { fg = "#242424", bg = "#cae682", gui = "bold" }, -- 黄緑
    b = { fg = "#f6f3e8", bg = "#444444" },
    c = { fg = "#857b6f", bg = "#242424" },
  },
  insert = {
    a = { fg = "#242424", bg = "#8ac6f2", gui = "bold" },
    b = { fg = "#f6f3e8", bg = "#444444" },
    c = { fg = "#857b6f", bg = "#242424" },
  },
  visual = {
    a = { fg = "#242424", bg = "#e5786d", gui = "bold" },
    b = { fg = "#f6f3e8", bg = "#444444" },
    c = { fg = "#857b6f", bg = "#242424" },
  },
  replace = {
    a = { fg = "#242424", bg = "#e5786d", gui = "bold" },
    b = { fg = "#f6f3e8", bg = "#444444" },
    c = { fg = "#857b6f", bg = "#242424" },
  },
  inactive = {
    a = { fg = "#857b6f", bg = "#242424" },
    b = { fg = "#857b6f", bg = "#242424" },
    c = { fg = "#857b6f", bg = "#242424" },
  },
}

require("lazy").setup({
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = wombat
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
	    show_filename_only = true,
	    show_bufnr = true,
          }
        }
      }
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
        { mode = "n", "<C-e>", "<cmd>Neotree toggle<CR>", {} }
    },
    config = function()
      require("neo-tree").setup({})

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            vim.cmd("Neotree show")
          end
        end,
      })
    end,
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      "folke/snacks.nvim",
    },
    keys = {
      {
        "<C-y>",
        function()
          require("opencode").toggle()
        end,
        desc = "Toggle OpenCode",
      },
    }
  },
  { "tpope/vim-sleuth" },
  {
    "evanleck/vim-svelte",
    ft = "svelte",
  },

  {
    "posva/vim-vue",
    ft = "vue",
  },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    priority = 1000,
  },
});

vim.cmd.colorscheme("arctic")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.number = true;
