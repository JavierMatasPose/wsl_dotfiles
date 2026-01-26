-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  hl_override = {
    ["@comment"] = { italic = true, fg = "#dcc7c0" },

    ["@module.python"] = { fg = "#f2cdcd" },
    ["@module"] = { fg = "#f2cdcd" },

    ["@string.python"] = { fg = "#F5DAB8" },
    ["@string"] = { fg = "#F5DAB8" },

    ["@function.python"] = { fg = "#B8F5C9", bold = true },
    ["@function"] = { fg = "#B8F5C9", bold = true },
    ["@function.method.call.python"] = { fg = "#B8F5C9" },
    ["@function.method.call"] = { fg = "#B8F5C9" },

    ["@keyword.function.python"] = { fg = "#cba6f7", bold = true },
    ["@keyword.function"] = { fg = "#cba6f7", bold = true },
    ["@keyword.return.python"] = { fg = "#cba6f7" },
    ["@keyword.return"] = { fg = "#cba6f7" },
    
    ["@keyword.conditional"] = { fg = "#b7bdf8" }, 
    ["@keyword.repeat"] = { fg = "#b7bdf8" },      

    ["@punctuation.bracket.python"] = { fg = "#94e2d5" },
    ["@punctuation.bracket"] = { fg = "#94e2d5" },
    ["@punctuation.delimiter.python"] = { fg = "#94e2d5" },
    ["@punctuation.delimiter"] = { fg = "#94e2d5" },

    ["@variable.parameter.python"] = { fg = "#b7bdf8" },
    ["@variable.parameter"] = { fg = "#b7bdf8" },
    ["@variable"] = { fg = "#B8DBF5" },
    ["@variable.python"] = { fg = "#B8DBF5" },

    ["@constructor.python"] = { fg = "#F0D6AD" },
    ["@constructor"] = { fg = "#F0D6AD" },
    ["@type"] = { fg = "#F0D6AD" }, 
    ["@punctuation.bracket.python"] = { fg = "#F0D6AD" }, 
    ["@punctuation.bracket"] = { fg = "#F0D6AD" }, 
    
    ["@keyword.import.python"] = { fg = "#cba6f7", bold = true },
    ["Include"] = { fg = "#cba6f7", bold = true },
    ["@type.python"] = { fg = "#eed49f" },
    ["Type"] = { fg = "#eed49f" },
    ["@type.builtin.python"] = { fg = "#eed49f" }, 
    ["@type.builtin"] = { fg = "#eed49f" }, 
    ["@attribute.python"] = { fg = "#f5a97f", italic = true },
    ["@attribute"] = { fg = "#f5a97f", italic = true },
  },
}

M.plugins="plugins.init"
M.nvimtree = {
  git = {
    enable = true,
    ignore = true,
  },
  filters = {
    dotfiles = true,
    git_ignored = true,
  },
}
return M
