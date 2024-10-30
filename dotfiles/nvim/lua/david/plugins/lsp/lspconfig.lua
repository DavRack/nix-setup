return {
  "neovim/nvim-lspconfig", 
  event = { "BufReadPre", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- local lspconfig = require("lspconfig")
    -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- local keymap = vim.keymap

    -- local opts = { noremap = true, silent = true }

    -- local on_attach = function(client, bufnr)
    --   opts.buffer = bufnr

    --   -- set keybinds
    --   opts.desc = "show lsp references"
    --   keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    --   opts.desc = "Go to declaration"
    --   keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    --   opts.desc = "show lsp definitions"
    --   keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    --   opts.desc = "show lsp implementations"
    --   keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    --   opts.desc = "show lsp type definitions"
    --   keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    --   opts.desc = "see lsp code actions"
    --   keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

    --   opts.desc = "smart rename"
    --   keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    --   opts.desc = "show buffer diagnostics"
    --   keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    --   opts.desc = "show line diagnostics"
    --   keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

    --   opts.desc = "show documentation"
    --   keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)

    --   opts.desc = "format file"
    --   keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  -- end

  -- local capabilities = cmp_nvim_lsp.default_capabilities()
  -- TODO: add signs for errors

  -- generic configuration for all language servers
  -- for _, lsp_server_name in ipairs(lsp_servers) do
  --     lspconfig[lsp_server_name].setup({
  --       capabilities = capabilities,
  --       on_attach = on_attach,
  --     })
  -- end

  -- specific configuration for language servers
    -- lspconfig["emmet_ls"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   filetypes = {"html", "css", "sass", "scss", "less", "svelte"},
    -- })

    -- lspconfig["lua_ls"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     Lua = {
    --       diagnostics = {
    --         globals = { "vim" },
    --       },
    --       workspace = {
    --         library = {
    --           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
    --           [vim.fn.stdpath("config") .. "/lua"] = true,
    --         },
    --       },
    --     },
    --   },
    -- })
end
}
