local null_ls = require('null-ls')

local b = null_ls.builtins

local sources = {
  b.code_actions.eslint,
  b.code_actions.refactoring,
  b.code_actions.shellcheck,
  b.diagnostics.eslint,
  b.diagnostics.flake8,
  b.diagnostics.hadolint,
  b.diagnostics.shellcheck,
  b.diagnostics.tsc,
  b.formatting.autopep8,
  b.formatting.clang_format,
  b.formatting.deno_fmt,
  b.formatting.prettier,
  b.formatting.stylua,
  b.formatting.taplo,
}

local options = {
  debug = true,
  sources = sources,
}

return options
