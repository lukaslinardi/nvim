local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        go = { { "goimports", "gofmt", "gopls" } },
    }
})

vim.keymap.set({ "n", "v" }, "F", function()
    conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end)
