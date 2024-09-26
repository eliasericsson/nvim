local bicep_lsp_bin = "/home/elias/.local/bin/bicep-langserver/Bicep.LangServer.dll"
require('lspconfig').bicep.setup {
    cmd = { "dotnet", bicep_lsp_bin },
    filetypes = { "bicep" },
    root_dir = require('lspconfig').util.root_pattern(".git", vim.fn.getcwd()),
    settings = {
        bicep = {
            telemetry = {
                enable = false,
            },
        },
    },
}
