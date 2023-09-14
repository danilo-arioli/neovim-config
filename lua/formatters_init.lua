local formatters = {
	{
		name = "prettierd",
		binary = "prettierd",
	},
	{
		name = "php-cs-fixer",
		binary = "php-cs-fixer",
	},
	{
		name = "stylua",
		binary = "stylua",
	},
}


-- Check and install each formatter
for _, formatter in ipairs(formatters) do
	local binary_exists = vim.fn.executable(formatter.binary)
	if binary_exists == 0 then
		vim.api.nvim_out_write(formatter.name .. " is not installed. Installing...\n")
		vim.fn.system("MasonInstall " .. formatter.name)
		vim.api.nvim_out_write(formatter.name .. " installed successfully.\n")
	end
end
