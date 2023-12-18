local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Define the path lazy.nvim plugin is stored

if not vim.loop.fs_stat(lazypath) then -- Check if the lazy.nvim plugin is at the path
    vim.fn.system({ -- If the plugin is not present, clone it using Git
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
 -- Themes
    {"catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Soothing and creamy color scheme for Neovim.
    "ellisonleao/gruvbox.nvim",    -- Retro groove color scheme, inspired by the classic Gruvbox.
    "dracula/vim",                 -- Dark and mysterious color scheme, based on the famous Dracula palette.
    "nvim-tree/nvim-web-devicons", -- Provide file-specific icons.
    "navarasu/onedark.nvim",       -- One Dark theme, a clean and vibrant color scheme.
    "sainnhe/edge",                -- Edge theme, a visually appealing and modern color scheme.
    "sainnhe/sonokai",             -- Sonokai theme, a colorful and vivid color scheme with multiple variations.
    "sainnhe/gruvbox-material",    -- Gruvbox Material, a material palette inspired modification of the Gruvbox
    "shaunsingh/nord.nvim",        -- Nord theme, a cold, dark color palette based on the Nord Arctic theme.
    "sainnhe/everforest",          -- Everforest theme, a comfortable greenish color scheme.
    "EdenEast/nightfox.nvim",      -- Nightfox theme, a highly customizable dark color scheme.
    "rebelot/kanagawa.nvim",       -- Kanagawa theme, inspired by the colors of the famous Japanese wave painting.
    "olimorris/onedarkpro.nvim",   -- One Dark Pro, an elegant and darker version of the One Dark theme.
    "tanvirtin/monokai.nvim",      -- Monokai theme, a classic, high contrast color scheme popular among developers.
    "marko-cerovac/material.nvim", -- Material theme, inspired by Google's Material Design with rich colors.

 -- Code suggestion and autocompletion
    "github/copilot.vim",                -- Provides a way for automated code suggestion.
    "hrsh7th/cmp-nvim-lsp",              -- Integrates Neovim's built-in LSP for enhanced coding assistance.
    "williamboman/mason-lspconfig.nvim", -- Integrate built-in LSP to provide an easy way to install, update, and configure language servers.
    "williamboman/mason.nvim",           -- Provide manager that simplifies the installation, management, and setup of LSP servers, linters, formatters, and other tools.
    "neovim/nvim-lspconfig",             -- Provide configurations and setups for LSP client, allowing easy connection to various language servers.
    "hrsh7th/nvim-cmp",                  -- Provide autocompletion plugin, supports variety of completion sources.
    "onsails/lspkind-nvim",
})