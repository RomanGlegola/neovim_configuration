local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Define the path lazy.nvim plugin is stored

-- Check if the lazy.nvim plugin is at the path
if not vim.loop.fs_stat(lazypath) then -- Check if the lazy.nvim plugin is at the path
    vim.fn.system({           -- If the plugin is not present, clone it using Git
        "git",
        "clone",
        "--filter=blob:none",   -- Clone with filter to minimize data transfer
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",      -- Clone the stable branch
        lazypath,               -- Clone into the specified path
    })
end

-- Prepend the plugin path to Neovim's runtime path
-- This ensures that the plugin is loaded by Neovim
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "tpope/vim-commentary",
    "mattn/emmet-vim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",
    "dracula/vim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "vim-test/vim-test",
    "lewis6991/gitsigns.nvim",
    "preservim/vimux",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "stevearc/oil.nvim",
    -- completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "github/copilot.vim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})
