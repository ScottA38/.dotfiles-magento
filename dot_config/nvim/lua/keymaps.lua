vim.keymap.set(
  "n",
  "<C-w>N",
  "<cmd>vnew<CR>",
  { desc = "Open vertical window" }
)

vim.keymap.set('n', '<leader>tt', function() 
  require("snacks").terminal.toggle()
end, { desc = "[T]oggle [T]erminal"})
