return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "minimax-m2.7:cloud",
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
			},
			log_level = "DEBUG",
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })
		keymap.set("n", "<leader>ci", "<cmd>CodeCompanion<CR>", { desc = "Open Code Companion Inline" })
	end,
}
