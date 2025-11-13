vim.o.swapfile = false
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.textwidth = 0
vim.o.splitright = true

vim.bo.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.g.netrw_keepdir = false
vim.g.netrw_winsize = 30
vim.g.netrw_banner = false
vim.g.netrw_localcopydircmd = "cp -r"

vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

vim.filetype.add {
  extension = {
    nix = "nix",
  },
}

local lang_config = {
  {
    pattern = "javascript",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "typescript",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "typescriptreact",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "javascriptreact",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "lua",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "nix",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "rust",
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
    end,
  },
  {
    pattern = "toml",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
  {
    pattern = "json",
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    end,
  },
}

for _, config in ipairs(lang_config) do
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = config.pattern,
    callback = config.callback,
  })
end

require "keymaps"
require("config.lazy")
