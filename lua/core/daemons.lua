local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup


augrp("ReloadOnChange", {clear = true})  -- Group for auto-commands that handle automatic reloading on files change.

aucmd({"FileChangedShellPost"}, {  -- Auto-command to notify when a file is changed outside of Neovim.
    pattern = "*",
    group = "ReloadOnChange",
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
    end,
  }
)

aucmd({"FocusGained"}, {  -- Auto-command to check for changes when Neovim gains focus.
    pattern = "*",
    group = "ReloadOnChange",
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

augrp("YankHighlight", {clear = true})  -- Group for auto-commands that highlight yanked text.

aucmd("TextYankPost", {  -- Auto-command to highlight yanked text with the 'IncSearch' highlight group for 1 second.
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({higroup = "IncSearch", timeout = "1000"})
    end
})

augrp("RestoreAfterYank", {clear = true})  -- Group for auto-commands that restore the cursor position after yanking.

aucmd("TextYankPost", {  -- Auto-command to remove the 'y' mark after yanking text.
    pattern = "*",
    group = "RestoreAfterYank",
    callback = function()
        vim.cmd([[
            silent! normal! `y
            silent! delmarks y
        ]])
    end,
})

augrp("TrailSpaceOnSave", {clear = true})  -- Group for auto-commands that remove trailing whitespace on save.

aucmd("BufWritePre", {  -- Auto-command to remove trailing whitespace before the buffer is written to a file.
    group = "TrailSpaceOnSave",
    pattern = "",
    command = ":%s/\\s\\+$//e"
})

augrp("DontAutoCommentNLines", { clear = true })  -- Group for auto-commands that disable automatic commenting on new lines.

aucmd({"BufEnter"}, {  -- Auto-command to change the 'formatoptions' setting to prevent auto-commenting.
    group = "DontAutoCommentNLines",
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o"
})

augrp("setLineLength", { clear = true })  -- Group for auto-commands that set line length for specific file types.

aucmd({"Filetype"}, {  -- Auto-command to set no color column for specific file types.
    group = "setLineLength",
    pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
    command = "setlocal cc=0"
})

augrp("setIndent", { clear = true })  -- Group for auto-commands that set indentation for specific file types.

aucmd({"Filetype"}, {  -- Auto-command to set the shift width and tab stop to 2 spaces for specific file types.
    group = "setIndent",
    pattern = {
        "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua"
    },
    command = "setlocal shiftwidth=2 tabstop=2"  -- Set shiftwidth and tabstop to 2 spaces for these file types
})

augrp("termPos", { clear = true })  -- Command 'Term' to open a terminal in the bottom-right split
aucmd({"CmdlineEnter"}, {
    group = "termPos",
    pattern = "*",
    command = "command! Term :botright vsplit term://$SHELL"  -- Define 'Term' command for easy terminal access
})

augrp("termUi", { clear = true })  -- Enter insert mode automatically when switching to a terminal buffer
augrp("termInsertMode", { clear = true })
aucmd({"TermOpen"}, {
    group = "termInsertMode",
    pattern = "*",
    command = "startinsert"  -- Start insert mode when a terminal opens
})

augrp("termLeave", { clear = true })  -- Exit insert mode automatically when leaving a terminal buffer
aucmd({"BufLeave"}, {
    group = "termLeave",
    pattern = "term://*",
    command = "stopinsert"  -- Stop insert mode when leaving a terminal buffer
})

augrp("pythonRelated", { clear = true })  -- Group for Python-related autocommands

aucmd({"Filetype"}, {  -- Autocommand for Python files to map a key for generating docstrings
    group = "pythonRelated",
    pattern = "*.py",
    command = "nmap <leader>d <Plug>(pydocstring)"
    -- Maps <leader>d to generate docstrings for Python functions when editing Python files
})

aucmd({"Filetype"}, {  -- Autocommand for Python files to map a key for formatting code with Black
    group = "pythonRelated",
    pattern = "*.py",
    command = "nmap <leader>p :Black<CR>"
    -- Maps <leader>p to format Python code using Black for Python files
})

augrp("dynamic_smartcase", { clear = true })  -- Group for dynamically toggling 'smartcase' based on command line activity

aucmd({"CmdLineEnter"}, {  -- Disable 'smartcase' when entering the command line
    pattern = "*",
    group = "dynamic_smartcase",
    command = "set nosmartcase"
    -- Disables 'smartcase' when the user starts typing a command
})

aucmd({"CmdLineLeave"}, { -- Re-enable 'smartcase' when leaving the command line
    pattern = "*",
    group = "dynamic_smartcase",
    command = "set smartcase"
    -- Re-enables 'smartcase' after the user finishes typing a command
})

augrp("acc_syntax_hl", { clear = true }) -- Group for syntax highlighting adjustments

aucmd({"BufEnter"}, { -- Ensure accurate syntax highlighting by syncing from the start of the file
    pattern = "*",
    group = "acc_syntax_hl",
    command = "syntax sync fromstart",
    -- Forces syntax highlighting to synchronize from the start of the file,
    -- which can help with accurate highlighting in large files or after complex edits
})

