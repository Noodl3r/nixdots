vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		local function typst_watch()
			vim.cmd("vsplit")
			vim.cmd("vertical resize 23")

			local file = vim.fn.expand("%:p")

			vim.cmd("terminal typst watch " .. vim.fn.shellescape(file))

			vim.cmd("wincmd h")
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
