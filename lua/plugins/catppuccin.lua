require("catppuccin").setup({ -- Require and set up the 'catppuccin' theme module.
    flavour = "mocha",        -- Choose the color flavor for the theme. Options: 'latte', 'frappe', 'macchiato', 'mocha'.
    background = {            -- Set the background variants for light and dark mode.
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- Enable transparent background.
    show_end_of_buffer = false,    -- Disable showing '~' characters at the end of the buffer.
    term_colors = true,            -- Enable setting terminal colors.
    
    dim_inactive = {       -- Configuration for dimming inactive windows.
        enabled = false,   -- Disable dimming of inactive windows.
        shade = "dark",    -- Set the shade type for dimming.
        percentage = 0.15, -- Set the dimming percentage.
    },
    styles = {                       -- Customize styles for various syntax groups.
        comments = { "italic" },     -- Italicize comments.
        conditionals = { "italic" }, -- Italicize conditionals.
    },

    color_overrides = {},   -- Custom color overrides.
    custom_highlights = {}, -- Custom highlight groups.

    integrations = {        -- Integration with other plugins.
        cmp = true,         -- Integration with nvim-cmp for auto-completion.
        gitsigns = true,    -- Integration with gitsigns for Git indicators.
        nvimtree = true,    -- Integration with NvimTree for file explorer.
        notify = true,      -- Integration with notify for notifications.
        mini = false,       -- Disable integration with mini plugins.
        dashboard = true,   -- Integration with dashboard-nvim for start screen.
        mason = true,       -- Integration with Mason for LSP installation.
        which_key = true,   -- Integration with which-key for keybindings popup.
        lsp_trouble = true, -- Integration with lsp-trouble for LSP diagnostics.
        telescope = true,   -- Integration with Telescope for fuzzy finding.
        treesitter = true,  -- Integration with treesitter for syntax highlighting.
        native_lsp = {      -- Native LSP settings.
            enabled = true,
            virtual_text = {                -- Customize virtual text styling for diagnostics.
                errors = { "italic" },      -- Italicize errors.
                hints = { "italic" },       -- Italicize hints.
                warnings = { "italic" },    -- Italicize warnings.
                information = { "italic" }, -- Italicize informations.
            },
            inlay_hints = {
                background = true, -- Enable background for inlay hints.
            },
        },
    },
})

vim.cmd("colorscheme catppuccin") -- Activate the colorscheme
