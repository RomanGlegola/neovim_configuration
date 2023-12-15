local options = { -- Table of option key, value pairs.
-- Display features.
    backspace = "2",           -- Backspacing over everything in insert mode.
    showcmd = true,            -- Displays incomplete commands in the bottom right of the Vim window.
    laststatus = 2,            -- Displays the status line, showing the filename and other information.
    autowrite = true,          -- Automatically saves changes to a file before running commands like :next.
    cursorline = true,         -- Highlights the line where the cursor is located.
    autoread = true,           -- Automatically reads the file when it's been changed from outside Vim.
    cmdheight = 2,             -- More space in command line for messages display.
    conceallevel = 0,          -- Make `` visible in markdown files.
    pumheight = 10,            -- Set pop up menu height.
    -- showmode = false,            -- Set hidden for info like - INSERT -.
    splitbelow = true,         -- Set new windows created with horizontal splits (like with the :split command) to open below the current window.
    splitright = true,         -- Set new windows created with vertical splits (such as with the :vsplit command) open to the right of the current window.
    termguicolors = true,      -- Set terminal gui colors.
    guifont = "monospace:h17", -- Set text font in graphical application.
    wrap = false,              -- Set if lines should be wrapped or displayed as one long line.

-- Text file features.
    fileencoding = "utf-8",    -- Forces UTF-8 encoding of the files.
    clipboard = "unnamedplus", -- Allows to access system clipboard.
    swapfile = true,           -- Set creation of swap files, used for recovery of unsaved changes in case of a crash or unexpected exit.
    undofile = true,           -- Set persistend undo.
    writebackup = false,       -- Set backup file if is edited via another program.
    timeoutlen = 1000,         -- Set time to wait for mapped sequence to complete.
    updatetime = 300,          -- Set inactivity time before triggering certain events.
    scrolloff = 8,             -- Set a minimum numbers of lines of context are visible around the cursor when scrolling through a document.

-- Search features.
    smartcase = true,  -- Set search case-insensitive unless the search pattern contains uppercase letters.
    ignorecase = true, -- Set search function case-insensitive, allowing it to find matches regardless of letter casing.

-- Usage spaces for tabs.
    smartindent = true, -- Set automatically adjusts the indentation level based on the syntax and structure of the code.
    smarttab = true,    -- Set intelligent behavior of the Tab key in insert mode, using the values of shiftwidth and tabstop for indentation and tab insertion respectively.
    tabstop = 4,        -- Number of spaces that a tab character represents.
    shiftwidth = 4,     -- Number of spaces to use for each step of (auto)indent.
    shiftround = true,  -- Rounds indent to a multiple of 'shiftwidth' when performing operations like >> or <<.
    expandtab = true,   -- Converts tabs to spaces, based on the value of tabstop.
    softtabstop = 4,    -- Set soft tab stop to 4 spaces
    showtabline = 2,    -- Set tab lines visible.

-- Line numbers.
    number = true,         -- Show line numbers.
    relativenumber = true, -- Show relative line numbers.
    numberwidth = 3,       -- Set number column width.
    signcolumn = "yes",    -- Set sign column.

-- Add custom flags.
    shortmess = vim.o.shortmess:find("c") and vim.o.shortmess or vim.o.shortmess .. "c", -- Add the "c" flag to the shortmess option.

-- Mouse support.
    mouse = "a", -- Enable mouse support in all modes.
}

for k, v in pairs(options) do -- Iterate over all key-value pairs in the options table.
    vim.opt[k] = v
end
