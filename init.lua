-- Bindings
local keymap = vim.keymap.set
vim.g.mapleader = " "
keymap("n", "<S-g>", "<S-g>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")
keymap("i", "<C-h>", "<C-w>")
keymap("i", "<C-Del>", "<C-o>dw")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-Up>", "<cmd>resize -2<CR>")
keymap("n", "<C-Down>", "<cmd>resize +2<CR>")
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
keymap("n", "<C-q>", "<cmd>q<CR>")
keymap("n", "<C-s>", "<cmd>w<CR>")
keymap("n", "<S-q>", "<cmd>bd<CR>")
keymap("n", "<leader>Q", "<cmd>bd!<CR>")
keymap("n", "<leader>q", "<cmd>qa<CR>")
keymap("n", "<leader>s", "<cmd>wa<CR>")
keymap("n", "<Tab>", "<cmd>bnext<CR>")
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>")
keymap("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
keymap("t", "<Esc>", "<C-Bslash><C-N>")
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("n", "<A-j>", "<cmd>m.+1<CR>==")
keymap("n", "<A-k>", "<cmd>m.-2<CR>==")
keymap("i", "<A-j>", "<Esc><cmd>m.+1<CR>==gi")
keymap("i", "<A-k>", "<Esc><cmd>m.-2<CR>==gi")
keymap("v", "<A-j>", ":m'>+1<CR>gv=gv", { silent = true })
keymap("v", "<A-k>", ":m'<-2<CR>gv=gv", { silent = true })
keymap("v", "p", '"_dP')
keymap("n", "<C-Bslash>", "<cmd>sp term://zsh<CR><cmd>resize -8<CR>i")
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>d", '"+ygvd')
keymap("v", "<leader>p", '"+p')
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>P", '"+P')
keymap("n", "<leader>P", '"+P')
keymap("n", "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>')
keymap("x", "<leader>/", '<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
keymap("n", "<leader>e", "<cmd>Ex<CR>")
keymap("n", "<leader>fe", "<cmd>e %:h/<C-d>")
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>")

-- Options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.showmode = false
vim.opt.cmdheight = 1
vim.opt.showcmd = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 250
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 20
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.spelllang = "en_us,pt_br"
vim.opt.virtualedit = "none"
vim.opt.listchars:append("tab:>>,extends:▷,precedes:◁,trail:·,nbsp:~")
vim.api.nvim_command("aunmenu PopUp")

-- Autocommands
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

-- Plugins Config
local function load_telescope()
	if pcall(require, "telescope") and pcall(require, "project_nvim") then
		require("telescope").setup({
			defaults = { path_display = { "smart" }, file_ignore_patterns = { ".git/", "node_modules" } },
		})
		require("project_nvim").setup({
			detection_methods = { "pattern" },
			patterns = { ".git", "Makefile", "package.json" },
		})
		require("telescope").load_extension("projects")
	end
end

local function load_lualine()
	if pcall(require, "lualine") then
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			always_visible = true,
		}
		local diff = {
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
			cond = hide_in_width,
		}
		local buffers = {
			"buffers",
			icons_enabled = false,
			icon = { align = "left" },
			symbols = { alternate_file = "" },
		}
		local spaces = function()
			return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end
		local function setTheme()
			local currentTheme = vim.api.nvim_command_output("colorscheme")
			if currentTheme:match("tokyonight") then
				return "tokyonight"
			elseif currentTheme:match("solarized") then
				return "gruvbox"
			end
		end
		require("lualine").setup({
			options = { theme = setTheme(), globalstatus = true, section_separators = "", component_separators = "" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diagnostics, "%=", buffers },
				lualine_x = { diff, spaces, "encoding", "filetype" },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
		})
	end
end

local function load_autopairs()
	if pcall(require, "nvim-autopairs") then
		require("nvim-autopairs").setup({
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
			},
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
end

local function load_treesitter()
	if pcall(require, "nvim-treesitter") then
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "bash", "lua", "markdown", "markdown_inline" },
			highlight = { enable = true },
			autopairs = { enable = true },
			indent = { enable = true },
		})
		require("nvim-treesitter.install").update({ with_sync = true })
	end
end

local function load_lsp()
	if pcall(require, "mason") and pcall(require, "mason-lspconfig") then
		local servers = {
			"bashls",
			"lua_ls",
		}

		require("mason").setup()
		require("mason-lspconfig").setup({ ensure_installed = servers, automatic_installation = true })

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			virtual_text = false,
			signs = { active = signs },
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(config)
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
			keymap("n", "gd", vim.lsp.buf.definition, bufopts)
			keymap("n", "K", vim.lsp.buf.hover, bufopts)
			keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
			keymap("n", "gr", vim.lsp.buf.references, bufopts)
			keymap("n", "gl", vim.diagnostic.open_float, bufopts)
			keymap("n", "<space>lf", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
			keymap("n", "<space>la", vim.lsp.buf.code_action, bufopts)
			keymap("n", "<space>lj", vim.diagnostic.goto_next, bufopts)
			keymap("n", "<space>lk", vim.diagnostic.goto_prev, bufopts)
			keymap("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
			keymap("n", "<space>lr", vim.lsp.buf.rename, bufopts)
			keymap("n", "<space>lq", vim.diagnostic.setloclist, bufopts)
			keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			keymap("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			keymap("n", "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<CR>', bufopts)
			keymap("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', bufopts)
			keymap("n", "<leader>di", '<cmd>lua require("dap").step_into()<CR>', bufopts)
			keymap("n", "<leader>do", '<cmd>lua require("dap").step_over()<CR>', bufopts)
			keymap("n", "<leader>dO", '<cmd>lua require("dap").step_out()<CR>', bufopts)
			keymap("n", "<leader>dr", '<cmd>lua require("dap").repl.toggle()<CR>', bufopts)
			keymap("n", "<leader>dl", '<cmd>lua require("dap").run_last()<CR>', bufopts)
			keymap("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', bufopts)
			keymap("n", "<leader>dt", '<cmd>lua require("dap").terminate()<CR>', bufopts)

			if client.name == "tsserver" or client.name == "lua_ls" then
				client.server_capabilities.documentFormattingProvider = false
			end
			vim.cmd([[:amenu PopUp.Go\ to\ Definition <cmd>:lua vim.lsp.buf.definition()<CR>]])
			vim.cmd([[:amenu PopUp.Go\ to\ Type\ Definition <cmd>:lua vim.lsp.buf.type_definition()<CR>]])
			vim.cmd([[:amenu PopUp.Go\ to\ Implementations <cmd>:lua vim.lsp.buf.implementation()<CR>]])
			vim.cmd([[:amenu PopUp.Go\ to\ References <cmd>:lua vim.lsp.buf.references()<CR>]])
			vim.cmd([[:amenu PopUp.-Sep- :]])
			vim.cmd([[:amenu PopUp.Rename\ Definition <cmd>:lua vim.lsp.buf.rename()<CR>]])
			vim.cmd([[:amenu PopUp.Code\ Actions <cmd>:lua vim.lsp.buf.code_action()<CR>]])
			vim.cmd([[:amenu PopUp.Format\ Document <cmd>:lua vim.lsp.buf.format({ async = true })<CR>]])
		end

		local opts = {}
		for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
			opts = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}
			server = vim.split(server, "@")[1]
			require("lspconfig")[server].setup(opts)
		end
	end
end

local function load_cmp()
	if pcall(require, "cmp") and pcall(require, "luasnip") then
		require("luasnip.loaders.from_vscode").lazy_load()
		vim.opt.completeopt = { "menuone", "noselect" }
		local kind_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-u>"] = cmp.mapping.scroll_docs(-1),
				["<C-d>"] = cmp.mapping.scroll_docs(1),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = kind_icons[vim_item.kind]
					vim_item.menu = ({
						nvim_lsp = "LSP",
						nvim_lua = "Lua",
						luasnip = "Snip",
						buffer = "Buffer",
						path = "Path",
						emoji = "Emoji",
					})[entry.source.name]
					return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = true },
			experimental = { ghost_text = true },
		})
	end
end

local function load_null_ls()
	if pcall(require, "null-ls") then
		require("null-ls").setup({
			debug = false,
			sources = {
				require("null-ls").builtins.formatting.prettier.with({
					extra_filetypes = { "toml" },
					extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
				}),
				require("null-ls").builtins.formatting.black.with({ extra_args = { "--fast" } }),
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.google_java_format,
				require("null-ls").builtins.diagnostics.flake8,
			},
		})
	end
end

local function load_dap()
	if pcall(require, "dapui") then
		require("dapui").setup({
			expand_lines = true,
			icons = { expanded = "", collapsed = "", circular = "" },
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.33,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					size = 0.27,
					position = "bottom",
				},
			},
			floating = {
				max_height = 0.9,
				max_width = 0.5,
				border = vim.g.border_chars,
			},
		})
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
		require("dap").listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end
		require("dap").listeners.before.event_terminated["dapui_config"] = function()
			require("dapui").close()
		end
		require("dap").listeners.before.event_exited["dapui_config"] = function()
			require("dapui").close()
		end
	end
end

local function load_gitsigns()
	if pcall(require, "gitsigns") then
		require("gitsigns").setup({
			signs = {
				add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "▎",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "契",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "契",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "▎",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
		})
	end
end

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
if pcall(require, "lazy") then
	local getBG = vim.api.nvim_command_output("!gsettings get org.gnome.desktop.interface color-scheme")
	require("lazy").setup({
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				if getBG:match("default") then
					vim.opt.background = "light"
					vim.cmd.colorscheme("solarized")
				elseif getBG:gmatch("prefer-dark") then
					vim.opt.background = "dark"
					vim.cmd.colorscheme("tokyonight-night")
				end
			end,
		},
		{
			"shaunsingh/solarized.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				if getBG:find("default") then
					vim.opt.background = "light"
					vim.cmd.colorscheme("solarized")
				elseif getBG:gmatch("prefer-dark") then
					vim.opt.background = "dark"
					vim.cmd.colorscheme("tokyonight-night")
				end
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "kyazdani42/nvim-web-devicons" },
			config = function()
				load_lualine()
			end,
		},
		{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
		{
			"nvim-telescope/telescope.nvim",
			event = "VeryLazy",
			dependencies = { "nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim" },
			config = function()
				load_telescope()
			end,
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				load_autopairs()
			end,
		},
		{ "numToStr/Comment.nvim", lazy = true },
		{
			"jinh0/eyeliner.nvim",
			event = "VeryLazy",
			config = function()
				require("eyeliner").setup({
					highlight_on_key = true,
					dim = true,
				})
			end,
		},
		{ "RRethy/vim-illuminate", event = "VeryLazy" },
		{
			"NvChad/nvim-colorizer.lua",
			event = "BufReadPost",
			config = function()
				if pcall(require, "colorizer") then
					require("colorizer").setup({
						user_default_options = {
							tailwind = true,
						},
					})
				end
			end,
		},
		{
			"lewis6991/gitsigns.nvim",
			event = "BufReadPre",
			config = function()
				load_gitsigns()
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			event = "BufReadPost",
			config = function()
				load_treesitter()
			end,
		},
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"saadparwaiz1/cmp_luasnip",
				"L3MON4D3/LuaSnip",
				"rafamadriz/friendly-snippets",
				"roobert/tailwindcss-colorizer-cmp.nvim",
			},
			config = function()
				load_cmp()
			end,
		},
		{
			"neovim/nvim-lspconfig",
			lazy = true,
		},
		{
			"williamboman/mason.nvim",
			dependencies = { "williamboman/mason-lspconfig.nvim" },
			config = function()
				load_lsp()
			end,
		},
		{
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufReadPre",
			config = function()
				load_null_ls()
			end,
		},
		{
			"rcarriga/nvim-dap-ui",
			lazy = true,
			dependencies = { "mfussenegger/nvim-dap" },
			config = function()
				load_dap()
			end,
		},
	})
end
