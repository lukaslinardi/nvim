local M = {}

-- Default theme (dark)
M.current_theme = "mellifluous"

-- Function to set theme
function M.set_theme(theme)
  if theme == "mellifluous" then
    vim.o.background = "dark"  -- set background for dark
    pcall(function()
      require('mellifluous').setup({})
    end)
    vim.cmd("colorscheme mellifluous")
  elseif theme == "gruvbox_light" then
    vim.o.background = "light"  -- set background for light
    vim.cmd("colorscheme gruvbox")
  else
    vim.cmd("colorscheme " .. theme)
  end
  M.current_theme = theme
end

-- Commands
vim.api.nvim_create_user_command("Light", function()
  M.set_theme("gruvbox_light")  -- switch to gruvbox light mode
end, {})

vim.api.nvim_create_user_command("Dark", function()
  M.set_theme("mellifluous")  -- switch to dark theme
end, {})

-- Optional: toggle command
vim.api.nvim_create_user_command("ToggleTheme", function()
  if M.current_theme == "mellifluous" then
    M.set_theme("gruvbox_light")
  else
    M.set_theme("mellifluous")
  end
end, {})

-- Set default theme on startup
M.set_theme(M.current_theme)

return M
