-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

  hl_override = {
	Comment = { italic = true, fg="#f4dbd6" },
	["@comment"] = { italic = true, fg="#f4dbd6" },
	},
}

M.plugins="plugins.init"
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}
M.nvimtree = {
  git = {
    enable = true,
    ignore = ture,
  },
  filters = {
    dotfiles = true,
    git_ignored = true,
  },
}
return M
