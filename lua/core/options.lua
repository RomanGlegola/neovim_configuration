-- set leader keys for shortcuts and mappings
vim.g.mapleader = ' '       -- Sets the "leader" key to the spacebar for custom shortcuts in Vim.
vim.g.maplocalleader = ' '  -- Sets the "local leader" key for buffer-local mappings.

-- display features
vim.opt.backspace = "2"   -- Backspacing over everything in insert mode.
vim.opt.showcmd = true    -- Displays incomplete commands in the bottom right of the Vim window.
vim.opt.laststatus = 2    -- Displays the status line, showing the filename and other information.
vim.opt.autowrite = true  -- Automatically saves changes to a file before running commands like :next.
vim.opt.cursorline = true -- Highlights the line where the cursor is located.
vim.opt.autoread = true   -- Automatically reads the file when it's been changed from outside Vim.

-- usage spaces for tabs
vim.opt.tabstop = 4       -- Number of spaces that a tab character represents.
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftround = true -- Rounds indent to a multiple of 'shiftwidth' when performing operations like >> or <<.
vim.opt.expandtab = true  -- Converts tabs to spaces, based on the value of tabstop.
vim.opt.smarttab = true   -- Enable smart tab
vim.opt.softtabstop = 4   -- Set soft tab stop to 4 spaces

-- mouse support
vim.mouse = "a" -- Enable mouse support in all modes
vim.keymap.set("v", "<RightMouse>", '"+y', {silent = true}) -- RMB click and copy selected text to clipboard.
vim.keymap.set("v", "<RightMouse>", '"+p', {silent = true}) -- RMB click and copy text from clipboard to the cursor location.

-- line numbers
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
