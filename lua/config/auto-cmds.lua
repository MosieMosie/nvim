vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- defaults:
    -- https://neovim.io/doc/user/news-0.11.html#_defaults

    -- Old + new merged keymaps
    map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gi", vim.lsp.buf.implementation, "Goto Implementation")
    map("<C-k>", vim.lsp.buf.signature_help, "Signature Help (old binding)")
    map("<leader>la", vim.lsp.buf.code_action, "Code Action")
    map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
    map("<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, "Format")
    map("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List Workspace Folders")
    map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
    map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
    map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
    map("gr", function()
      require("telescope.builtin").lsp_references()
    end, "Find References")
    map("[e", function()
      vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, "Prev Error")
    map("]e", function()
      vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, "Next Error")
    map(
      "<leader>v",
      "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
      "Goto Definition in Vertical Split"
    )

    -- Highlight on CursorHold
    local function client_supports_method(client, method, bufnr)
      if vim.fn.has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
      client
      and client_supports_method(
        client,
        vim.lsp.protocol.Methods.textDocument_documentHighlight,
        event.buf
      )
    then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
        end,
      })
    end
  end,
})
