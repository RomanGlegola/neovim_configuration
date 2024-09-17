vim.loader.enable() -- Byte compiling lua files to load them faster

local version = vim.version

local function load_configs_from_directory(directory)    -- Load configuration files from a specified directory.
    local config_files = vim.split(vim.fn.glob("~/.config/nvim/lua/" .. directory .. "/*.lua"), "\n") -- Find all Lua files in the given directory and split them into a list.

    for _, path in ipairs(config_files) do               -- Iterate through each configuration file found.
        if path and path ~= "" then
            local config_file_path = vim.fn.split(path, "/") -- Split the file path and extract the file name.
            local file = string.gsub(config_file_path[#config_file_path], "%.lua?$", "")                  -- Remove the '.lua' extension from the file name.
            if file ~= "init" then                           -- Exclude the 'init' file to prevent redundant loading.
                require(directory .. "." .. file)            -- Dynamically require the configuration file based on its directory and file name.
            end
        end
    end
end

load_configs_from_directory("core")           -- Load configuration files from the 'core' directory.
load_configs_from_directory("plugins") -- Load configuration files from the 'plugin-configs' directory.