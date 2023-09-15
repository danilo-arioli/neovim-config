return {
	"startup-nvim/startup.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("startup").setup({
			-- every line should be same width without escaped \
			header = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Header",
				margin = 5,
				content = {
					" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
					" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
					" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
					" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
					" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
					" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
				},
				highlight = "statement",
				default_color = "",
				oldfiles_amount = 0,
			},
			-- name which will be displayed and command
			body = {
				type = "mapping",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Basic Commands",
				margin = 5,
				content = {
					{ "  Find File", "Telescope find_files", "leader+ff" },
					{ "󰊤  Find Git Files", "Telescope git_files", "leader+fg" },
					{ "  Find Word", "Telescope live_grep", "leader+fw" },
					{ "  Recent Files", "Telescope oldfiles", "leader+fr" },
					{ "  Toggle terminal", "ToggleTerm", "<Ctrl-t>" },
					{ "󰙅  Toggle | Focus File Tree", "NvimTreeToggle", "leader+n | +e" },
					{ "  New | Close | Change Split", "vsplit", "leader+ns | +cs | +Tab" },
					{ "󰓩  New | Close | Change Tab", "tabnew", "leader+nt| +ct | Tab" },
					{
						"󰈙 Show Definitions | Declarations | Type Definitions",
						"",
						"leader+si | +sdd | +d | +td",
					},
					{
						" Show Implementations | What's Under The Cursor",
						"",
						"leader+si | ?",
					},
					{ "󰷈 Code actions | References | Smart Rename", "", "leader+ca | +sr | +rn" },
					{ "  Surround Word With Quotes Or Whatelse", "", "ysiw+' | +( | +[ | +{" },
					{ "󰆾  Move Lines While Visually Selected", "", "K | J" },
				},
				highlight = "bool",
				default_color = "",
				oldfiles_amount = 0,
			},
			footer = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Footer",
				margin = 5,
				content = { "github.com/danilo-arioli" },
				highlight = "bool",
				default_color = "",
				oldfiles_amount = 0,
			},

			options = {
				mapping_keys = true,
				cursor_column = 0.5,
				empty_lines_between_mappings = true,
				disable_statuslines = true,
				paddings = { 1, 3, 3, 0 },
			},
			mappings = {
				execute_command = "<CR>",
				open_file = "o",
				open_file_split = "<c-o>",
				open_section = "<TAB>",
				open_help = "?",
			},
			colors = {
				background = "#1f2227",
				folded_section = "#56b6c2",
			},
			parts = { "header", "footer",  "body" },
		})
	end,
}
