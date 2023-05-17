local M = {}

M.disabled = {
  n = {
    ["<C-s>"] = ""
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.mykeys = {
  n = {
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
  },
  t = {
    ["<A-j>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd j")
      end,
      "Go to lower window from terminal"
    },
    ["<A-k>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd k")
      end,
      "Go to upper window from terminal"
    },
  }
}

return M
