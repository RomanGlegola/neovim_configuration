local keymap = vim.keymap

-- Navigate panes
keymap.set("n", "<c-k>", ":wincmd k<cr>", {silent = true}) -- Moves the cursor to the window above.
keymap.set("n", "<c-j>", ":wincmd j<cr>", {silent = true}) -- Moves the cursor to the window below.
keymap.set("n", "<c-h>", ":wincmd h<cr>", {silent = true}) -- Moves the cursor to the window on the left.
keymap.set("n", "<c-l>", ":wincmd l<cr>", {silent = true}) -- Moves the cursor to the window on the right.

keymap.set("n", "<leader>h", ":nohlsearch<cr>", {silent = true}) -- Turns off search highlighting until the next search.

-- Mouse support
keymap.set("v", "<RightMouse>", '"+y', {silent = true}) -- RMB click and copy selected text to clipboard.
keymap.set("v", "<RightMouse>", '"+p', {silent = true}) -- RMB click and copy text from clipboard to the cursor location.

-- Text operations
keymap.set("i", "<c-u>", "<Esc>viwUea") -- Turn the word under cursor to upper case
keymap.set("i", "<c-t>", "<Esc>b~lea") -- Turn the current word into title case

-- Leader keys for shortcuts and mappings
vim.g.mapleader = ' '       -- Sets the "leader" key to the spacebar for custom shortcuts in Vim.
vim.g.maplocalleader = ' '  -- Sets the "local leader" key for buffer-local mappings.