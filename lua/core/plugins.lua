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
    --{"catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- Soothing and creamy color scheme for Neovim.
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

 -- Navigation and File Management
    "nvim-tree/nvim-tree.lua",        -- File explorer tree for efficient navigation and file system management.
    "christoomey/vim-tmux-navigator", -- Seamless navigation between Vim and tmux.
    "akinsho/bufferline.nvim",        -- Provide stylish and functional tab/buffer line, enables easy navigation and management of multiple buffers.

 -- Status Line and UI Enhancements
    "nvim-lualine/lualine.nvim", -- Fast and easy-to-configure status line plugin.
    "nvimdev/dashboard-nvim",    -- Clean and customizable startup dashboard, provide quick access to frequently used commands and files.
    "itchyny/vim-highlighturl",  -- Highlights URLs in text files for better visibility and quick identification of links.
    "rcarriga/nvim-notify",      -- Notification manager that replaces the native message and error notifications with more visually appealing ones.
    "tyru/open-browser.vim",     -- Easily open URLs and files in a web browser directly from within Neovim, enhancing web integration.
    "stevearc/dressing.nvim",    -- Improve the user interface elements, like input prompts and select menus, making them more visually appealing and user-friendly.

 -- Git
    "lewis6991/gitsigns.nvim", -- Provide Git integration by showing git signs in the sign column, like added, modified, or removed lines.
    --"tpope/vim-fugitive",      -- Provide Git wrapper, allowing Git operations directly within Neovim and access to a wide range of features.

 -- Test
    "vim-test/vim-test", -- Provide test run environment, supporting a wide range of test runners and languages.

 -- Script execution
    "preservim/vimux", -- Provide way to run shell commands in a tmux pane without leaving Neovim.

 -- Text helpers
    "tpope/vim-surround",                  -- Provide way to easily delete, change, and add surroundings in pairs, such as parentheses, brackets, quotes, XML tags, etc. etd.
    "tpope/vim-commentary",                -- Provide streamlined way to comment and uncomment lines or blocks of code
    --"nvim-treesitter/nvim-treesitter",     -- Provide syntax highlighting and code parsing library, improves code readability and editor features.
    "mattn/emmet-vim",                     -- Provide support for expanding abbreviations similar to emmet.io, greatly enhancing HTML & CSS workflow.
    "lukas-reineke/indent-blankline.nvim", -- Provide visualisation of indentation levels with subtle lines

 -- Lua
    "stevearc/oil.nvim",                 -- Provide improved syntax highlighting, autocompletion, and linting for Lua code.
    "L3MON4D3/LuaSnip",                  -- Provide way to define and use lua code snippets easily.
    "saadparwaiz1/cmp_luasnip",          -- Integrates LuaSnip with "nvim-cmp", completion engine.
    { -- Fuzzy finder over lists, enabling easy file searching, buffer management, and more.
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" } -- Required as a dependency.
    },

 -- Python
    { "Vimjas/vim-python-pep8-indent", ft = "python" }, -- Python PEP8 indentation standards
    { "jeetsukumaran/vim-pythonsense", ft = "python" }, -- Enhancements for navigating and editing Python code

 -- Code suggestion and autocompletion
    "github/copilot.vim",                -- Provides a way for automated code suggestion.
    "hrsh7th/cmp-nvim-lsp",              -- Integrates Neovim's built-in LSP for enhanced coding assistance.
    "williamboman/mason-lspconfig.nvim", -- Integrate built-in LSP to provide an easy way to install, update, and configure language servers.
    "williamboman/mason.nvim",           -- Provide manager that simplifies the installation, management, and setup of LSP servers, linters, formatters, and other tools.
    -- "neovim/nvim-lspconfig",             -- Provide configurations and setups for LSP client, allowing easy connection to various language servers.
    -- "hrsh7th/nvim-cmp",                  -- Provide autocompletion plugin, supports variety of completion sources.

 -- Documentation and API Tools
    { -- Provide previewing of Swagger/OpenAPI specifications.
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher", -- Required as a dependency.
    },
    { -- Provide real-time Markdown preview in a web browser. 
        "iamcco/markdown-preview.nvim", -- It require an additional npm installation within the "app" directory for its functionality.
        run = "cd app && npm install",  -- Required as a dependency.
    },
})