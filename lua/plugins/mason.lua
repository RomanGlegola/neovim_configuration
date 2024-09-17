local mason = require("mason")  -- Load the 'mason' module to use its functionalities.
local mason_lspconfig = require("mason-lspconfig")  -- Load the 'mason-lspconfig' module, integrating Mason with LSP (Language Server Protocol) configuration.
local mason_tools = require("mason-tool-installer")

mason.setup({                -- Mason setup
    ui = {                   -- Configuration options for Mason.
        border = "rounded",  -- Set the UI border style to rounded for Mason's interface.
        icons = {
            package_installed = "✓",   -- Icon to display for installed packages.
            package_pending = "➜",     -- Icon to display for packages that are pending installation.
            package_uninstalled = "✗", -- Icon to display for packages that are not installed.
        },
    },
})

mason_lspconfig.setup({             -- Mason-LSPconfig integration setup
    automatic_installation = true,  -- Automatically install LSP servers. When set to true, Mason will auto-install LSP servers.

    ensure_installed = {  -- Specify the list of LSP servers that Mason should ensure are installed.
        "pyright",        -- Python language server.
        "lua_ls",         -- Lua language server.
        "ts_ls",          -- TypeScript language server.
        "rust_analyzer",  -- Rust language server.
        "clangd",         -- C/C++ language server.
        "jsonls",         -- JSON language server.
        "bashls",         -- BASH language server.
        "dockerls",       -- Docker language server.
        "yamlls",         -- YAML language server.
        "vimls",          -- VIM language server.
        "powershell_es",  -- PWSH language server.
        "diagnosticls",
    },
})

mason_tools.setup({            -- Mason-Tools integration setup
    automatic_installation = true,  -- Automatically install tools servers. When set to true, Mason will auto-install.

    ensure_installed = {  -- Specify the list of tools servers that Mason should ensure are installed.
        "pylint",         -- Python linter.
        "black",          -- Python formatter.
    },
})
