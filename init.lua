-- vim.loader.enable() -- Byte compiling lua files to load them faster

-- local version = vim.version

local config_files = vim.split(vim.fn.glob("~/.config/nvim/lua/core/*.lua"), "\n") -- List with all config files.

for _, path in ipairs(config_files) do -- Source config files from config_files list.
    config_file_path = vim.fn.split(path, "/")
    file = string.gsub(config_file_path[#config_file_path], "%.lua?$", "")
    if file ~= "init" then
        require("core." .. file)
    end
end


