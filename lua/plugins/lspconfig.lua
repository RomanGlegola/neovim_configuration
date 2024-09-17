local servers = {   -- List of Language Server Protocol (LSP) servers to be configured.
  'pyright',        -- Python language server.
  'lua_ls',         -- Lua language server.
  'vimls',          -- Vim script language server.
  'bashls',         -- Bash language server.
  'html',           -- HTML language server.
  'diagnosticls',   -- General diagnostics language server.
  'cssls',          -- CSS language server.
  'clangd',         -- C/C++ language server.
  'groovyls',       -- Groovy language server.
  'rust_analyzer',  -- Rust language server.
  'rls',            -- Rust Language Server (alternative to rust_analyzer).
}

local opts = { noremap = true, silent = true }  -- Common options for key mappings

local api = vim.api                -- Shortcut to access Neovim's API.
local lsp = vim.lsp                -- Shortcut to access Neovim's LSP.
local diagnostic = vim.diagnostic  -- Shortcut to access Neovim's diagnostic functions.
local fn = vim.fn                  -- Shortcut for Neovim's function library.

-- Diagnostic key mappings:
api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)  -- Map <space>e to open a floating diagnostic window.
api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)         -- Map [d to go to the previous diagnostic.
api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)         -- Map ]d to go to the next diagnostic.
api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)  -- Map <space>q to set the location list for diagnostics.

local on_attach = function(client, bufnr)  -- Function called when each LSP server attaches to a buffer.
    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")  -- Set the buffer's 'omnifunc' to use Neovim's built-in LSP functions for autocompletion.
    
    -- The following lines establish key mappings for various LSP-related actions:
    api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)                                        -- Map 'gD' to go to the declaration of the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)                                         -- Map 'gd' to go to the definition of the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                                               -- Map 'K' to show hover information for the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)                                     -- Map 'gi' to list all implementations for the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)                                  -- Map '<C-k>' to show signature information for the function being called.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)                        -- Map '<space>wa' to add the current directory to the workspace folders.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)                     -- Map '<space>wr' to remove the current directory from the workspace folders.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)  -- Map '<space>wl' to print the list of configured workspace folders.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)                              -- Map '<space>D' to go to the type definition of the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)                                      -- Map '<space>rn' to rename the symbol under the cursor across the workspace.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)                                 -- Map '<space>ca' to show available code actions at the cursor position.
    api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)                                         -- Map 'gr' to list all references to the symbol under the cursor.
    api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)                                   -- Map '<space>f' to format the current buffer.

    api.nvim_create_autocmd("CursorHold", {  -- Create an auto command that triggers on the 'CursorHold' event.
        buffer = bufnr,              -- Apply this auto command to the current buffer.
        callback = function()        -- Define what happens when the 'CursorHold' event occurs.
            local float_opts = {     -- Configuration options for the floating diagnostic window.
                focusable = false,   -- Make the floating window not focusable.
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },  -- Close the window on these events.
                border = "rounded",  -- Use a rounded border for the window.
                source = "always",   -- Always show the source of the diagnostic in the window.
                prefix = " ",        -- A prefix to use before the diagnostic text.
            }
            if not vim.b.diagnostics_pos then  -- Initialize or reset the diagnostics position tracking variable.
                vim.b.diagnostics_pos = { nil, nil }
            end
            local cursor_pos = api.nvim_win_get_cursor(0)  -- Get the current cursor position.
            if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])  -- Check if the cursor position has changed and if there are diagnostics to show.
                and #diagnostic.get() > 0
            then
                diagnostic.open_float(nil, float_opts)  -- Open the floating diagnostic window if conditions are met.
            end
            vim.b.diagnostics_pos = cursor_pos  -- Update the stored diagnostics position to the current cursor position.
        end,
    })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())  -- Update nvim-cmp capabilities for LSP servers

local lspconfig = require("lspconfig")  -- LSP server configurations

lspconfig.pylsp.setup {           -- Setup for Python Language Server Protocol (LSP) with pylsp
    on_attach = on_attach,        -- Function to run when the language server attaches to a buffer.
    settings = {                  -- Configuration settings for the pylsp server.
        pylsp = {
            plugins = {           -- Configuration for various plugins of pylsp.
                pylint = { enabled = true, executable = "pylint" },  -- Enable pylint with a specified executable.
                pyflakes = { enabled = false },                      -- Disable pyflakes.
                pycodestyle = { enabled = false },                   -- Disable pycodestyle.
                jedi_completion = { fuzzy = true },                  -- Enable fuzzy completion using Jedi.
                pyls_isort = { enabled = true },                     -- Enable isort for sorting imports.
                pylsp_mypy = { enabled = true },                     -- Enable mypy for type checking.
            },
        },
    },
    flags = {
        debounce_text_changes = 200,   -- Debounce text changes notifications to the server to improve performance.
    },
    capabilities = capabilities,       -- Include extended capabilities from nvim-cmp for autocompletion.
}

lspconfig.clangd.setup {               -- Setup for C/C++ Language Server Protocol (LSP) with clangd
    on_attach = on_attach,             -- Function to run when clangd attaches to a buffer.
    capabilities = capabilities,       -- Include extended capabilities from nvim-cmp.
    filetypes = { "c", "cpp", "cc" },  -- Specify filetypes that clangd should be used for.
    flags = {
        debounce_text_changes = 500,   -- Debounce text change notifications for performance.
    },
}

lspconfig.vimls.setup {               -- Setup for Vim script Language Server Protocol (LSP) with vimls
    on_attach = on_attach,            -- Function to run when vimls attaches to a buffer.
    flags = {
        debounce_text_changes = 500,  -- Debounce text change notifications for performance.
    },
    capabilities = capabilities,      -- Include extended capabilities from nvim-cmp.
}

lspconfig.bashls.setup {          -- Setup for Bash Language Server Protocol (LSP) with bashls
    on_attach = on_attach,        -- Function to run when bashls attaches to a buffer.
    capabilities = capabilities,  -- Include extended capabilities from nvim-cmp.
}

lspconfig.lua_ls.setup {    -- Setup for Lua Language Server Protocol (LSP) with lua_ls
    on_attach = on_attach,  -- Function to run when lua_ls attaches to a buffer.
    settings = {            -- Configuration settings for lua_ls.
        Lua = {
            runtime = {
                version = 'LuaJIT',  -- Specify the Lua version being used (LuaJIT for Neovim).
            },
            diagnostics = {
                globals = { 'vim', 'require' },  -- Specify global variables recognized by the server (like 'vim' for Neovim).
            },
            workspace = {                        -- Configure the server's understanding of the workspace and Lua libraries.
                library = {
                    api.nvim_get_runtime_file("", true),                         -- Include Neovim runtime files.
                    fn.stdpath("data") .. "/site/pack/packer/opt/emmylua-nvim",  -- Include EmmyLua annotations for better Neovim API support.
                    fn.stdpath("config"),                                        -- Include user's Neovim configuration files.
                },
            },
        },
    },
    capabilities = capabilities,  -- Include extended capabilities from nvim-cmp.
}

function add_capabilities()  -- Define a function named 'add_capabilities'.
    for _, lsp in ipairs(servers) do       -- Iterate over each LSP server listed in the 'servers' array.
        require("lspconfig")[lsp].setup({  -- For each LSP server, load its configuration using 'require("lspconfig")[lsp]'.
            capabilities = capabilities,   -- Set the 'capabilities' for the LSP server. 
            on_attach = on_attach,         -- Define the 'on_attach' function for the LSP server. 
        })
    end
end

diagnostic.config {  -- Configuration for diagnostic appearance and behavior.
    underline = false,                                   -- Disable underlining for diagnostics.
    virtual_text = {
        severity = { min = diagnostic.severity.ERROR },  -- Show virtual text only for errors.
    },
    signs = true,                                        -- Enable sign column diagnostics.
    severity_sort = true,                                -- Sort diagnostics by severity.
}

fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })       -- Define the sign for diagnostic errors.
fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })         -- Define the sign for diagnostic warnings.
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })  -- Define the sign for diagnostic information messages.
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })         -- Define the sign for diagnostic hints.

lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {  -- Set the hover handler configuration for LSP.
    border = "rounded",
})

add_capabilities()  -- Apply the defined capabilities to all LSP servers.
