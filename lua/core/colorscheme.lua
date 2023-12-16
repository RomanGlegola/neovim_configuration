local colorscheme = "catppuccin-frappe"   -- Define the preferred colorscheme.

vim.api.nvim_create_autocmd("VimEnter", { -- Triggers the auto-command. In this case, the auto-command is triggered when NeoVim finishes loading.
    callback = function()
        local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)  -- Attempt to apply the colorscheme using a protected call.
        if not status_ok then -- Check if the colorscheme was applied successfully
            vim.notify("colorscheme " .. colorscheme .. "not found!")       -- If not successful, notify the user that the colorscheme was not found.
        end                   -- Exit the script if the colorscheme could not be applied.
    end,
})
