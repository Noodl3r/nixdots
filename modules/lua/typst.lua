vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		local function typst_watch()
			local file = vim.fn.expand("%:p")

			vim.fn.system({
				"tmux",
				"split-window",
				"-h",
				"-p",
				"23",
				"typst",
				"watch",
				file,
			})
		end

		vim.keymap.set("n", "<leader>c", typst_watch, {
			buffer = true,
			silent = true,
		})

		vim.keymap.set("n", "<leader>r", function()
			local pdf = vim.fn.expand("%:p:r") .. ".pdf"

			vim.cmd("!zathura --fork " .. vim.fn.shellescape(pdf) .. " &")
		end, {
			buffer = true,
			silent = true,
		})
	end,
})
