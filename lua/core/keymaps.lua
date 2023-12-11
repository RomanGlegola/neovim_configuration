local keymap = vim.keymap

-- Navigate vim panes better
keymap.set("n", "<c-k>", ":wincmd k<cr>", {silent = true}) -- Moves the cursor to the window above.
keymap.set("n", "<c-j>", ":wincmd j<cr>", {silent = true}) -- Moves the cursor to the window below.
keymap.set("n", "<c-h>", ":wincmd h<cr>", {silent = true}) -- Moves the cursor to the window on the left.
keymap.set("n", "<c-l>", ":wincmd l<cr>", {silent = true}) -- Moves the cursor to the window on the right.

keymap.set("n", "<leader>h", ":nohlsearch<cr>", {silent = true}) -- Turns off search highlighting until the next search.

