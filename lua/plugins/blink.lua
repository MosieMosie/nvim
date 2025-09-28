return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    opts = {
      keymap = {
        preset = "none",
        -- Show completion manually
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

        -- Select movement and completion
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next()
            end
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            end
          end,
          "fallback",
        },

        -- Optional movement and scroll
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        -- Signature help
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true },
        trigger = { show_on_insert_on_trigger_character = false },
      },
      signature = { enabled = true },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            name = "LSP",
            enabled = true,
            score_offset = 1000, -- Highest priority
            min_keyword_length = 1, -- Require at least 1 character
          },
          snippets = {
            name = "Snippets",
            enabled = true,
            max_items = 10,
            min_keyword_length = 1, -- Require at least 1 character
            score_offset = 750,
          },
          path = {
            name = "Path",
            score_offset = 500, -- Medium-high priority
            min_keyword_length = 1,
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },
          buffer = {
            name = "Buffer",
            enabled = true,
            max_items = 5,
            min_keyword_length = 2,
            score_offset = 250,
          },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
