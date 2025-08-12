-- C# and .NET Language Server Configuration with Blazor support
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        omnisharp = {
          -- Enable Blazor support
          on_init = function(client)
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenModifiers = { "static", "abstract", "deprecated", "readonly" },
                tokenTypes = {
                  "namespace", "type", "class", "enum", "interface", "struct", "typeParameter", "parameter",
                  "variable", "property", "enumMember", "event", "function", "method", "macro", "keyword",
                  "modifier", "comment", "string", "number", "regexp", "operator"
                }
              },
              range = true
            }
          end,
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
            },
            RoslynExtensionsOptions = {
              EnableAnalyzersSupport = true,
              EnableImportCompletion = true,
              AnalyzeOpenDocumentsOnly = false,
            },
            Sdk = {
              IncludePrereleases = true,
            },
          },
          filetypes = { "cs", "vb", "razor" },
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json")(fname)
          end,
        },
        -- Blazor and Razor specific LSP
        razor_ls = {
          settings = {
            razor = {
              languageServer = {
                debug = false,
              },
            },
          },
          filetypes = { "razor", "cshtml" },
        },
      },
    },
  },
  -- Additional tools for C# development
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "csharpier", -- C# formatter
      },
    },
  },
}
