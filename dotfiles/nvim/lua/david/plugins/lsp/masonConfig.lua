lsp_servers = {
        -- this list was taken from: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        --
        --"snyk_ls", -- All
        -- "ast_grep", -- ast-grep
--        "awk_ls", -- AWK
        "als", -- Ada
        "angularls", -- Angular
        "ansiblels", -- Ansible
        "antlersls", -- Antlers
        "apex_ls", -- Apex
        "arduino_language_server", -- Arduino
        "asm_lsp", -- Assembly (GAS/NASM, GO)
        "astro", -- Astro
        "azure_pipelines_ls", -- Azure Pipelines
        "bashls", -- Bash
        "pkgbuild_language_server", -- Bash
        "beancount", -- Beancount
        "bicep", -- Bicep
        "bright_script", -- BrighterScript
        "bufls", -- Buf
        "clangd", -- C
        -- "csharp_ls", -- C#
        "clangd", -- C++
        "cairo_ls", -- Cairo
        "neocmake", -- CMake
        "cssls", -- CSS
--        "clarity_lsp", -- Clarity
        "clojure_lsp", -- Clojure
        "codeqlls", -- CodeQL
        -- "server", -- Autoconf	autotools-language
--        "crystalline", -- Crystal
        "cucumber_language_server", -- Cucumber
        -- "custom_elements_ls", -- Custom Elements Language Server
        "dagger", -- Cue
        "cypher_ls", -- Cypher
        -- "denols", -- Deno
        "dhall_lsp_server", -- Dhall
        --"diagnosticls", -- Diagnostic (general purpose server)
        "serve_d", -- Dlang
        "dockerls", -- Docker
        "docker_compose_language_service", -- Docker Compose
        "dotls", -- Dot
        "drools_lsp", -- Drools
        --"efm", -- EFM (general purpose server)
        -- "eslint", -- ESLint
        "elixirls", -- Elixir
        "elmls", -- Elm
        "ember", -- Ember
        "emmet_language_server", -- Emmet
        "erg_language_server", -- Erg
--        "erlangls", -- Erlang
        -- "fsautocomplete", -- F#
        "facility_language_server", -- Facility Service Definition
        "fennel_language_server", -- Fennel
        "flux_lsp", -- Flux
        "foam_ls", -- Foam (OpenFOAM)
        "fortls", -- Fortran
        "gleam", -- Gleam
        "glint", -- Glint
        "gopls", -- Go
        "gradle_ls", -- Gradle
        "grammarly", -- Grammarly
        "graphql", -- GraphQL
--        "groovyls", -- Groovy
        "hdl_checker", -- HDL
        "html", -- HTML
        "htmx", -- HTMX
--        "hls", -- Haskell
        "haxe_language_server", -- Haxe
        "helm_ls", -- Helm
        "hoon_ls", -- Hoon
        --"biome", -- JSON
        "tsserver",
--        "java_language_server", -- Java
        "jsonnet_ls", -- Jsonnet
        "julials", -- Julia (docs)
        "jqls", -- jq
        "kotlin_language_server", -- Kotlin
        "ltex", -- LaTeX
        "lelwel_ls", -- Lelwel
        "lua_ls", -- Lua
        "luau_lsp", -- Luau
        "lwc_ls", -- LWC
        -- "server", -- Make	autotools-language
        "marksman", -- Markdown
        "matlab_ls", -- Matlab
        "mdx_analyzer", -- MDX
        "swift_mesonls", -- Meson
        "mm0_ls", -- Metamath Zero
        "move_analyzer", -- Move
        "mutt_ls", -- Mutt
        "nickel_ls", -- Nickel
        --"nim_langserver", -- Nim
        --"nimls", -- Nim
--        "nil_ls", -- Nix
        "ocamllsp", -- OCaml
        "ols", -- Odin
        "bsl_ls", -- OneScript, 1C:Enterprise
        "spectral", -- OpenAPI
        "opencl_ls", -- OpenCL
        "openscad_lsp", -- OpenSCAD
        "intelephense", -- PHP
        "perlnavigator", -- Perl
        "pest_ls", -- Pest
        "powershell_es", -- Powershell
        "prismals", -- Prisma
        "puppet", -- Puppet
        "purescriptls", -- PureScript
        "pyright", -- Python
        "pylsp", -- Python (docs)
--        "r_language_server", -- R
        "raku_navigator", -- Raku
        "rescriptls", -- ReScript
        "reason_ls", -- Reason
        "robotframework_ls", -- Robot Framework
--        "ruby_ls", -- Ruby
--        "salt_ls", -- Salt
--        "theme_check", -- Shopify Theme Check
        "slint_lsp", -- Slint
        "smithy_ls", -- Smithy
        "solang", -- Solidity
        "esbonio", -- Sphinx
        "stylelint_lsp", -- Stylelint
        "svelte", -- Svelte
        "stimulus_ls", -- Stimulus
        "svlangserver", -- SystemVerilog
        "svls", -- SystemVerilog
--        "verible", -- SystemVerilog
        "taplo", -- TOML
        "tailwindcss", -- Tailwind CSS
--        "teal_ls", -- Teal
        "templ", -- Templ
        "terraformls", -- Terraform
        "tflint", -- Terraform
        "thriftls", -- Thrift
        "typst_lsp", -- Typst
        "v_analyzer", -- V
        --"vala_ls", -- Vala
        "veryl_ls", -- Veryl
        "vimls", -- VimL
        "visualforce_ls", -- Visualforce
        "vuels", -- Vue
        "wgsl_analyzer", -- WGSL
        "lemminx", -- XML
        "yamlls", -- YAML
        "zls", -- Zig
}
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
      automatic_instalation = true,
    })
  end
}
