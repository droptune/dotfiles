local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.deno_lint,
    null_ls.builtins.diagnostics.dotenv_linter,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.spectral,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.tidy,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
}
return opts
