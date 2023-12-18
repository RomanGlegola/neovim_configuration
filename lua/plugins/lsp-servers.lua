local lspconfig = require('lspconfig') -- Import the 'lspconfig' module, which is used to configure language servers in Neovim.

local on_attach = function(client, bufnr) -- Define a common 'on_attach' function to be called when an LSP server attaches to a buffer.
    -- The body of the function should contain common setup code for when an LSP server attaches.
end

local capabilities = vim.lsp.protocol.make_client_capabilities()                                               -- Create a baseline set of capabilities.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) -- Enhance capabilities with those required by the 'cmp_nvim_lsp' plugin for improved autocompletion.

lspconfig.pyright.setup{         -- Configure the Python LSP server ('pyright').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities for autocompletion.
}

lspconfig.lua_ls.setup{          -- Configure the Lua LSP server ('lua_ls').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
    settings = {
        Lua = {                  -- Specific settings for the Lua language server here.
        }
    }
}

lspconfig.vimls.setup{           -- Configure the Vim Script LSP server ('vimls').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.bashls.setup{          -- Configure the Bash LSP server ('bashls').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.html.setup{            -- Configure the HTML LSP server.
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.cssls.setup{           -- Configure the CSS LSP server ('cssls').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.clangd.setup{          -- Configure the C/C++ LSP server ('clangd').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.groovyls.setup{        -- Configure the Groovy LSP server ('groovyls').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.rust_analyzer.setup{   -- Configure the Rust LSP server ('rust_analyzer').
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
}

lspconfig.rls.setup{             -- Configure the Rust (RLS) LSP server.
    on_attach = on_attach,       -- Use the common 'on_attach' function.
    capabilities = capabilities, -- Use the enhanced capabilities.
    settings = {
        rust = {                 -- Include specific settings for the Rust (RLS) language server here.
        }
    }
}

lspconfig.diagnosticls.setup{     -- Configure the Diagnostic Language Server ('diagnosticls').
    on_attach = on_attach,        -- Use the common 'on_attach' function.
    capabilities = capabilities,  -- Use the enhanced capabilities.
    filetypes = {"javascript", "typescript", "python", "ruby", "lua", "bash", "shell", "markdown", "json"}, -- Specify the filetypes it should be active for.
    init_options = {
        linters = { -- Define linters to be used here.
        },
        filetypes = {
            python = "pylint", -- Map the 'python' filetype to use 'pylint'.
        }
    }
}
