local signs = { -- Diagnostic signs definitions.
  Error = "✘",
  Warn = "⚠️",
  Hint = "💡",
  Info = "ℹ️"
}

for type, icon in pairs(signs) do -- Loop over the signs.
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({ -- Configure diagnostic text.
    virtual_text = {
        prefix = '→'
    }
})
