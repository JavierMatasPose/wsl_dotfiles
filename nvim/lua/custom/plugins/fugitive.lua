return {
  'tpope/vim-fugitive',
  config = function()
    -- AQUÍ PUEDES DEFINIR TUS ATAJOS
    -- Por ejemplo, <Espacio> + g + s para abrir la ventana de Git
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

    -- Otro ejemplo: <Espacio> + g + c para hacer commit
    -- vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })
  end,
}
