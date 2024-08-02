return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            end
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "gopls" }
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capablities = capabilities
                })
            end,
        })
    end,
}
