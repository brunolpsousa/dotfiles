-- Bindings
vim.g.mapleader = " "
vim.keymap.set("n", "<S-g>", "<S-g>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<S-q>", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>bd!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>qa<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>")
vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>")
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<A-j>", ":m.+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m.-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m'<-2<CR>gv=gv")
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("n", "<C-\\>", "<cmd>sp term://zsh<CR><cmd>resize -8<CR>i")
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>d", '"+ygvd')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>/", '<cmd>lua require"Comment.api".toggle.linewise.current()<CR>')
vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require"Comment.api".toggle.linewise(vim.fn.visualmode())<CR>')
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>fe", ":e %:h/<C-d>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<cr>')
vim.keymap.set("n", "<leader>dc", '<cmd>lua require"dap".continue()<cr>')
vim.keymap.set("n", "<leader>di", '<cmd>lua require"dap".step_into()<cr>')
vim.keymap.set("n", "<leader>do", '<cmd>lua require"dap".step_over()<cr>')
vim.keymap.set("n", "<leader>dO", '<cmd>lua require"dap".step_out()<cr>')
vim.keymap.set("n", "<leader>dr", '<cmd>lua require"dap".repl.toggle()<cr>')
vim.keymap.set("n", "<leader>dl", '<cmd>lua require"dap".run_last()<cr>')
vim.keymap.set("n", "<leader>du", '<cmd>lua require"dapui".toggle()<cr>')
vim.keymap.set("n", "<leader>dt", '<cmd>lua require"dap".terminate()<cr>')

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
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 20
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars:append("tab:>>,extends:▷,precedes:◁,trail:·,nbsp:~")
vim.opt.spelllang = "en,pt"
vim.opt.virtualedit = "none"
vim.api.nvim_command("colorscheme slate")

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

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		local line_count = vim.api.nvim_buf_line_count(0)
		if line_count >= 5000 then
			vim.cmd("IlluminatePauseBuf")
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
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
		local function themeOpt()
			local colorscheme = vim.api.nvim_command_output("colorscheme")
			if colorscheme:match("tokyonight") then
				return "tokyonight"
			else
				return "onedark"
			end
		end
		require("lualine").setup({
			options = { theme = themeOpt(), globalstatus = true, section_separators = "", component_separators = "" },
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
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
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
	if pcall(require, "mason-lspconfig") and pcall(require, "mason") then
		local servers = {
			"html",
			"cssls",
			"yamlls",
			"bashls",
			"clangd",
			"jdtls",
			"lua_ls",
			"jsonls",
			"tsserver",
			"pyright",
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
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
			vim.keymap.set("n", "<space>lf", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
			vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "<space>lk", vim.diagnostic.goto_next, bufopts)
			vim.keymap.set("n", "<space>lj", vim.diagnostic.goto_prev, bufopts)
			vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>lq", vim.diagnostic.setloclist, bufopts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)

			if client.name == "tsserver" then
				client.server_capabilities.documentFormattingProvider = false
			elseif client.name == "lua_ls" then
				client.server_capabilities.documentFormattingProvider = false
			end
		end

		local opts = {}
		for _, server in pairs(servers) do
			opts = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
						telemetry = { enable = false },
					},
					python = {
						analysis = { typeCheckingMode = "off" },
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
		vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
		require("cmp").setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-k>"] = require("cmp").mapping.select_prev_item(),
				["<C-j>"] = require("cmp").mapping.select_next_item(),
				["<C-b>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
				["<C-c>"] = require("cmp").mapping({
					i = require("cmp").mapping.abort(),
					c = require("cmp").mapping.close(),
				}),
				["<CR>"] = require("cmp").mapping.confirm({ select = true }),
				["<Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_next_item()
					elseif require("luasnip").expandable() then
						require("luasnip").expand()
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_prev_item()
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
					return vim_item
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = { behavior = require("cmp").ConfirmBehavior.Replace, select = false },
			window = {
				completion = require("cmp").config.window.bordered(),
				documentation = require("cmp").config.window.bordered(),
			},
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
	require("lazy").setup({
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("tokyonight-night")
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
			event = "BufEnter",
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
		{ "numToStr/Comment.nvim", event = "BufRead" },
		{ "RRethy/vim-illuminate", event = "VeryLazy" },
		{
			"NvChad/nvim-colorizer.lua",
			config = function()
				if pcall(require, "colorizer") then
					require("colorizer").setup({})
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
				"saadparwaiz1/cmp_luasnip",
			},
			config = function()
				load_cmp()
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = { "rafamadriz/friendly-snippets" },
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
			event = "VeryLazy",
			dependencies = { "mfussenegger/nvim-dap" },
			config = function()
				load_dap()
			end,
		},
	})
end
