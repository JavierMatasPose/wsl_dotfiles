return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = require "configs.treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}
