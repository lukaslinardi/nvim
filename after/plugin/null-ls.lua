local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        formatting.prettier, formatting.black, formatting.golines, formatting.gofumpt, formatting.goimports, formatting.shfmt,
        formatting.clang_format, formatting.cmake_format, formatting.dart_format,
        formatting.lua_format.with({
            extra_args = {
                '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
                '--break-after-table-lb', '--indent-width=2'
            }
        }), formatting.isort, formatting.codespell.with({ filetypes = { 'markdown' } })
    },
})
