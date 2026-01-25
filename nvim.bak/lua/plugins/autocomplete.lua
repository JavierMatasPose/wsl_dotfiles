return{
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    lazy = false,
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      -- EAGER COMPLETION CONFIGURATION
      completion = {
        trigger = {
          -- Show immediately when typing triggers (like '.')
          show_on_trigger_character = true,
          -- Show immediately when starting to type
          show_on_keyword = true,
          -- Optional: If you want menu on InsertEnter, set this to true (noisy!)
          -- show_on_insert = true, 
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- Trigger completion even with 0 characters
        min_keyword_length = 0,
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  }
}
