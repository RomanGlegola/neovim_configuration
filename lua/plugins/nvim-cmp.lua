local cmp = require("cmp")         -- Load the 'cmp' module for autocompletion.
local lspkind = require("lspkind") -- Load the 'lspkind' module for LSP pictograms.

local has_words_before = function()                          -- Define a utility function to check if the cursor is preceded by a word.
    local line, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current cursor position.
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil -- Check if there is a non-space character before the cursor.
end

cmp.setup({     -- Main configuration for nvim-cmp.
    snippet = { -- Function to expand snippets.
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- Use UltiSnips for snippet expansion.
        end,
    },
    window = {
        completion = { -- Completion window appearance.
            border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'}, -- Set the border style for completion menu.
            winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None', -- Set the highlight groups for different parts of the completion menu.
        },
        
        documentation = { -- Documentation window appearance.
            border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'}, -- Set the border style for documentation.
            winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None', -- Set the highlight groups for different parts of the documentation window.
        },
    },
    mapping = cmp.mapping.preset.insert({ -- Key mappings for completion actions.
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),           -- Scroll up documentation.
        ['<C-f>'] = cmp.mapping.scroll_docs(4),            -- Scroll down documentation.
        ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion.
        ['<C-e>'] = cmp.mapping.abort(),                   -- Abort/close the completion menu.
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection.
        ["<Tab>"] = cmp.mapping(function(fallback)         -- Handle <Tab> key behavior.
            if cmp.visible() then cmp.select_next_item()   -- Select the next item in the completion menu.
            elseif has_words_before() then cmp.complete()  -- Trigger completion at the current cursor position.
            else fallback()                                -- Default behavior for <Tab> key.
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()             -- Handle <Shift-Tab> key behavior.
            if cmp.visible() then cmp.select_prev_item() -- Select the previous item in the completion menu.
            end
        end, { "i", "s" }),
    }),
    sources = { -- Define the sources for completion items.
        { name = 'nvim_lsp' },                                -- Source from Neovim's built-in LSP client.
        { name = 'treesitter' },                              -- Source from Tree-sitter parsers.
        { name = 'ultisnips' },                               -- Source from UltiSnips snippets.
        { name = 'path', option = { trailing_slash = true }}, -- Source for file path completions.
        { name = 'nvim_lsp_signature_help' },                 -- Source for LSP signature help.
        { name = 'buffer', keyword_length = 5},               -- Source from current buffer.
        { name = 'buffer-lines'},                             -- Source from buffer lines.
        { name = 'calc'},                                     -- Source for calculations.
    },
    view = { -- Configuration for how entries are displayed.
        entries = "custom", -- Use a custom view for entries.
    },
    completion = { -- Completion behavior settings.
        keyword_length = 1,            -- Minimum length of a word to trigger completion.
        completeopt = "menu,noselect", -- Completion menu options.
    },
    formatting = { -- Format the appearance of completion items.
    format = lspkind.cmp_format({ -- Use 'lspkind' to format completion items.
        mode = "symbol_text",     -- Include both symbols (icons) and text in completion items.
        menu = {                  -- Custom menu labels for different completion sources.
            nvim_lsp = "[LSP]",  -- Label for items coming from Neovim's built-in LSP.
            ultisnips = "[US]",  -- Label for UltiSnips snippet completions.
            nvim_lua = "[Lua]",  -- Label for Lua-specific completions (e.g., Neovim's Lua API).
            path = "[Path]",     -- Label for file path completions.
            buffer = "[Buffer]", -- Label for buffer completions (words from the current buffer).
            emoji = "[Emoji]",   -- Label for emoji completions.
            omni = "[Omni]",     -- Label for Omni completion (generic completion).
        },
    }),
},
})

cmp.setup.filetype('gitcommit', { -- Configure completion for specific filetypes, such as Git commit messages.
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- Completion source for Git-related items.
    }, {
        { name = 'buffer' },  -- Buffer as a source.
    })
})

cmp.setup.cmdline('/', { -- Configure completion for the command-line mode.
    mapping = cmp.mapping.preset.cmdline(), -- Use preset cmdline mappings.
    sources = {
        { name = 'buffer' }                 -- Use buffer as a source for cmdline.
    }
})

vim.cmd( -- Additional Neovim highlight commands to customize the appearance of completion items.
    [[ 
        highlight! link CmpItemMenu Comment
        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
        highlight! link FloatBorder Normal
        highlight! link NormalFloat Normal
    ]])