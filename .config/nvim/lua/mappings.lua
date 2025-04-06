local map  = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>]", "<C-]>", { desc = "Go to definition" })
map("t", "<A-j>", function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd j")
  end, { desc = "Go to lower window from terminal"})
map("t", "<A-k>", function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd k")
  end, { desc = "Go to upper window from terminal"})

local nomap = vim.keymap.del
-- nomap("n", "<C-s>")
