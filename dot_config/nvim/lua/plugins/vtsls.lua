return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                -- Increase memory limit from default 3072MB to 8192MB
                maxTsServerMemory = 12000,
                -- Reduce file watching overhead
                watchOptions = {
                  watchFile = "useFsEventsOnParentDirectory",
                  watchDirectory = "useFsEvents",
                  fallbackPolling = "dynamicPriorityPolling",
                  -- Exclude heavy directories from watching
                  excludeDirectories = { "**/node_modules", "**/.git" },
                },
              },
              -- Disable auto-insertion features to reduce overhead
              autoUseWorkspaceTsdk = true,
            },
            typescript = {
              -- Disable features that cause heavy recomputation
              preferences = {
                importModuleSpecifier = "non-relative",
              },
              -- Reduce inlay hints (they cause constant recomputation)
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
              suggest = {
                completeFunctionCalls = false,
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
              suggest = {
                completeFunctionCalls = false,
              },
            },
          },
        },
      },
    },
  },
}
