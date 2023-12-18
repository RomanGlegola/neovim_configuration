local mason = require("mason")  -- Load the 'mason' module to use its functionalities.
local mason_lspconfig = require("mason-lspconfig")  -- Load the 'mason-lspconfig' module, integrating Mason with LSP (Language Server Protocol) configuration.

mason.setup({               -- Mason setup
    ui = {                  -- Configuration options for Mason.
        border = "rounded", -- Set the UI border style to rounded for Mason's interface.
        icons = {
            package_installed = "✓",   -- Icon to display for installed packages.
            package_pending = "➜",     -- Icon to display for packages that are pending installation.
            package_uninstalled = "✗", -- Icon to display for packages that are not installed.
        },
    },
})

mason_lspconfig.setup({            -- Mason-LSPconfig integration setup
    automatic_installation = true, -- Automatically install LSP servers. When set to true, Mason will auto-install LSP servers.

    ensure_installed = { -- Specify the list of LSP servers that Mason should ensure are installed.
        "pyright",       -- Python language server.
        "lua_ls",        -- Lua language server.
        "tsserver",      -- TypeScript language server.
        "rust_analyzer", -- Rust language server.
        "clangd",        -- C/C++ language server.
    },
})
