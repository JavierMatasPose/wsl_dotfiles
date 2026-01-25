-- Cargamos las utilidades de NvChad (necesarias para los atajos y UI)
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init

-- Obtenemos las capabilities de Blink (Autocompletado)
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Lista de servidores básicos
local servers = { "html", "cssls" }

-- 1. Configuración de servidores simples
for _, lsp in ipairs(servers) do
  -- Definimos la configuración en la tabla global de vim
  vim.lsp.config[lsp] = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
  -- Habilitamos el servidor
  vim.lsp.enable(lsp)
end

-- 2. Configuración específica de PYRIGHT
vim.lsp.config["pyright"] = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
}
-- Habilitamos Pyright explícitamente
vim.lsp.enable("pyright")
