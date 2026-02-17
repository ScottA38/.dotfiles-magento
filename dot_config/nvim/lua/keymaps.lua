vim.keymap.set("n", "<leader>ot", ":tabnew term://zsh", { desc = "[T]oggle [T]erminal" })
vim.keymap.set("n", "<leader>u", "<cmd>Rexplore<CR>", { desc = "Return to netrw from editing file (or vice-versa)" })
vim.keymap.set("n", "<leader>ee", "<cmd>Explore<CR>", { desc = "Return to netrw from editing file (or vice-versa)" })
vim.keymap.set("n", "<leader>nh", "<CR> :noh<CR>", { desc = "Un-highlight hl search matches" })
