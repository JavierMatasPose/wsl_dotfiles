require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "Git Diff This (Comparar con commit)" })
-- map({ "n", "i", "v" }, "<C9-s>", "<cmd> w <cr>")
map("n", "<space>fh", require("telescope.builtin").help_tags)
map("n", "<space>fc", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath("config")
  }
  end)
