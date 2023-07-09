-- Bindings
local keymap = vim.keymap.set
vim.g.mapleader = " "
keymap("n", "<S-g>", "<S-g>zz", { desc = "Goto last line" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
keymap("n", "<C-b>", "<C-b>zz", { desc = "Page up" })
keymap("n", "<C-f>", "<C-f>zz", { desc = "Page down" })
keymap("n", "n", "nzzzv", { desc = "Next matching search pattern" })
keymap("n", "N", "Nzzzv", { desc = "Previous matching search pattern" })
keymap("n", "J", "mzJ`z", { desc = "Join lines" })
keymap("i", "<C-h>", "<C-w>", { desc = "Delete previous word" })
keymap("i", "<C-Del>", "<C-o>dw", { desc = "Detele next word" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Goto left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Goto lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Goto upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Goto right window" })
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
keymap("n", "<C-q>", "<cmd>q<CR>", { desc = "Close window" })
keymap({ "n", "v", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save" })
-- keymap({ "n", "v", "i" }, "<C-s>", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })
keymap("n", "<S-q>", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap("n", "<leader>Q", "<cmd>bd!<CR>", { desc = "Force close buffer" })
keymap("n", "<leader>q", "<cmd>qa<CR>", { desc = "Close all windows" })
keymap("n", "<leader>s", "<cmd>wa<CR>", { desc = "Save all" })
keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })
keymap("t", "<Esc>", "<C-Bslash><C-N>", { desc = "Return to normal mode" })
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })
keymap("n", "<A-j>", "<cmd>m.+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m.-2<CR>==", { desc = "Move line up" })
keymap("i", "<A-j>", "<Esc><cmd>m.+1<CR>==gi", { desc = "Move line down" })
keymap("i", "<A-k>", "<Esc><cmd>m.-2<CR>==gi", { desc = "Move line up" })
keymap("v", "<A-j>", ":m'>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
keymap("v", "<A-k>", ":m'<-2<CR>gv=gv", { silent = true, desc = "Move line up" })
keymap("n", "<C-Bslash>", "<cmd>sp term://$SHELL<CR><cmd>resize -8<CR>i", { desc = "Open terminal" })
keymap("n", "<leader>e", "<cmd>Ex<CR>", { desc = "Switch to Ex mode" })
keymap("n", "<leader>fe", ":e %:h/<C-d>", { desc = "Find files" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Telescope projects" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope buffers" })
keymap("v", "p", '"_dP', { desc = "Paste" })
keymap("v", "<leader>d", '"+ygvd', { desc = "Delete to clipboard" })
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Comment line" })
keymap(
	"x",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Comment block" }
)

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
vim.cmd("aunmenu PopUp")

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

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		local getBG = vim.fn.system("gtk-query-settings | awk '/gtk-theme-name:/{print $2}'")
		if not getBG:find("dark") then
			vim.opt.background = "light"
			pcall(vim.cmd.colorscheme, "catppuccin-latte")
		else
			vim.opt.background = "dark"
			pcall(vim.cmd.colorscheme, "catppuccin-mocha")
		end
		if pcall(require, "lualine") then
			require("lualine").setup({ options = { theme = "catppuccin" } })
		end
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		local exclude = { "diff" }
		local buf = vim.api.nvim_get_current_buf()
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		vim.cmd([[:%s/\s\+$//e]])
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

-- Plugins
local function load_telescope()
	require("telescope").setup({
		defaults = { path_display = { "smart" }, file_ignore_patterns = { ".git/", "node_modules" } },
	})
	require("project_nvim").setup({
		detection_methods = { "pattern" },
		patterns = { ".git", "Makefile", "package.json" },
	})
	require("telescope").load_extension("projects")
end

local function load_lualine()
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

	require("lualine").setup({
		options = { globalstatus = true, section_separators = "", component_separators = "" },
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

local function load_comment()
	require("Comment").setup({
		ignore = "^$",
		pre_hook = function(ctx)
			-- Only calculate commentstring for tsx filetypes
			if vim.bo.filetype == "typescriptreact" then
				local U = require("Comment.utils")

				-- Determine whether to use linewise or blockwise commentstring
				local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

				-- Determine the location where to calculate commentstring from
				local location = nil
				if ctx.ctype == U.ctype.blockwise then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = type,
					location = location,
				})
			end
		end,
	})
end

local function load_autopairs()
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

local function load_treesitter()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"css",
			"dockerfile",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"typescript",
			"yaml",
		},
		highlight = { enable = true },
		autopairs = { enable = true },
		indent = { enable = true },
		context_commentstring = { enable = true, enable_autocmd = false },
	})
	require("nvim-treesitter.install").update({ with_sync = true })
end

local function load_lsp()
	local servers = {
		"bashls",
		"cssls",
		"html",
		"jsonls",
		"lua_ls",
		"pyright",
		"tailwindcss",
		"tsserver",
		"yamlls",
	}

	local packages = {
		"black",
		"flake8",
		"prettier",
		"shellcheck",
		"stylua",
	}
	vim.api.nvim_create_user_command("MasonInstallAll", function()
		vim.cmd("MasonInstall " .. table.concat(packages, " "))
	end, {})

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

		if client.name == "tsserver" or client.name == "lua_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end

		-- Mappings
		if pcall(require, "which-key") then
			require("which-key").register({
				l = { name = "LSP" },
				d = { name = "Debug" },
				w = { name = "Workspace" },
			}, { prefix = "<leader>" })
		end

		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		keymap("n", "gD", vim.lsp.buf.declaration, { bufopts.opts, desc = "Goto Declaration" })
		keymap("n", "gd", vim.lsp.buf.definition, { bufopts.opts, desc = "Goto Definition" })
		keymap("n", "K", vim.lsp.buf.hover, { bufopts.opts, desc = "Hover" })
		keymap("n", "gi", vim.lsp.buf.implementation, { bufopts.opts, desc = "Goto Implementation" })
		keymap("n", "gr", vim.lsp.buf.references, { bufopts.opts, desc = "References" })
		keymap("n", "gl", vim.diagnostic.open_float, { bufopts.opts, desc = "Open float" })
		keymap("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, { bufopts.opts, desc = "Format" })
		keymap("n", "<leader>la", vim.lsp.buf.code_action, { bufopts.opts, desc = "Code Action" })
		keymap("n", "<leader>lw", vim.lsp.codelens.run, { bufopts.opts, desc = "CodeLens Action" })
		keymap("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { bufopts.opts, desc = "Telescope Quickfix" })
		keymap(
			"n",
			"<leader>ls",
			"<cmd>Telescope lsp_document_symbols<cr>",
			{ bufopts.opts, desc = "Document Symbols" }
		)
		keymap(
			"n",
			"<leader>lS",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			{ bufopts.opts, desc = "Workspace Symbols" }
		)
		keymap("n", "<leader>lj", vim.diagnostic.goto_next, { bufopts.opts, desc = "Next Diagnostic" })
		keymap("n", "<leader>lk", vim.diagnostic.goto_prev, { bufopts.opts, desc = "Previous Diagnostic" })
		keymap("n", "<leader>ls", vim.lsp.buf.signature_help, { bufopts.opts, desc = "Signature Help" })
		keymap("n", "<leader>lr", vim.lsp.buf.rename, { bufopts.opts, desc = "Rename" })
		keymap("n", "<leader>lq", vim.diagnostic.setloclist, { bufopts.opts, desc = "Quickfix" })
		keymap("n", "<leader>D", vim.lsp.buf.type_definition, { bufopts.opts, desc = "Goto Type Definition" })
		keymap(
			"n",
			"<leader>lb",
			"<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
			{ bufopts.opts, desc = "Buffer Diagnostics" }
		)
		keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { bufopts.opts, desc = "Diagnostics" })
		keymap(
			"n",
			"<leader>wa",
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			{ bufopts.opts, desc = "Workspace Diagnostics" }
		)
		keymap("n", "<leader>wp", vim.lsp.buf.add_workspace_folder, { bufopts.opts, desc = "Add Workspace Folder" })
		keymap(
			"n",
			"<leader>wr",
			vim.lsp.buf.remove_workspace_folder,
			{ bufopts.opts, desc = "Remove Workspace Folder" }
		)
		keymap("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { bufopts.opts, desc = "List Workspace Folders" })

		keymap(
			"n",
			"<leader>db",
			'<cmd>lua require("dap").toggle_breakpoint()<CR>',
			{ bufopts.opts, desc = "Toggle Breakpoint" }
		)
		keymap(
			"n",
			"<leader>dB",
			"<cmd>lua require(\"dap\").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			{ bufopts.opts, desc = "Breakpoint Condition" }
		)
		keymap(
			"n",
			"<leader>dC",
			'<cmd>lua require("dap").run_to_cursor()<CR>',
			{ bufopts.opts, desc = "Run to Cursor" }
		)
		keymap(
			"n",
			"<leader>dg",
			'<cmd>lua require("dap").goto_()<CR>',
			{ bufopts.opts, desc = "Go to line (no execute)" }
		)
		keymap(
			"n",
			"<leader>du",
			'<cmd>lua require("dapui").toggle({reset = true})<CR>',
			{ bufopts.opts, desc = "Dap UI" }
		)
		keymap("n", "<leader>de", '<cmd>lua require("dapui").eval()<CR>', { bufopts.opts, desc = "Eval" })
		keymap("n", "<leader>dw", '<cmd>lua require("dap.ui.widgets").hover()<CR>', { bufopts.opts, desc = "Widgets" })
		keymap("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', { bufopts.opts, desc = "Continue" })
		keymap("n", "<leader>dd", '<cmd>lua require("dap").disconnect()<CR>', { bufopts.opts, desc = "Disconnect" })
		keymap("n", "<leader>di", '<cmd>lua require("dap").step_into()<CR>', { bufopts.opts, desc = "Step Into" })
		keymap("n", "<leader>db", '<cmd>lua require"dap".step_back()<CR>', { bufopts.opts, desc = "Step Back" })
		keymap("n", "<leader>do", '<cmd>lua require("dap").step_over()<CR>', { bufopts.opts, desc = "Step Over" })
		keymap("n", "<leader>dO", '<cmd>lua require("dap").step_out()<CR>', { bufopts.opts, desc = "Step Out" })
		keymap("n", "<leader>dr", '<cmd>lua require("dap").repl.toggle()<CR>', { bufopts.opts, desc = "Toggle REPL" })
		keymap("n", "<leader>dl", '<cmd>lua require("dap").run_last()<CR>', { bufopts.opts, desc = "Run Last" })
		keymap("n", "<leader>dt", '<cmd>lua require("dap").terminate()<CR>', { bufopts.opts, desc = "Terminate" })
		keymap("n", "<leader>dj", '<cmd>lua require("dap").down()<CR>', { bufopts.opts, desc = "Down" })
		keymap("n", "<leader>dk", '<cmd>lua require("dap").up()<CR>', { bufopts.opts, desc = "Up" })
		keymap("n", "<leader>dp", '<cmd>lua require("dap").pause()<CR>', { bufopts.opts, desc = "Pause" })
		keymap("n", "<leader>ds", '<cmd>lua require("dap").session()<CR>', { bufopts.opts, desc = "Get Session" })

		-- Context menu
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

local function load_cmp()
	require("luasnip.loaders.from_vscode").lazy_load()
	vim.opt.completeopt = { "menuone", "noselect" }
	local kind_icons = {
		Codeium = "",
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

	-- https://github.com/jcdickinson/codeium.nvim/issues/20 || https://github.com/jcdickinson/codeium.nvim/issues/38
	local file_size = vim.api.nvim_exec2("echo getfsize(expand(@%))", { output = true })
	file_size = tonumber(file_size.output)
	if file_size > -2 and file_size <= 127830 then
		require("codeium").setup({})
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
				if vim_item.kind == "Color" and entry.completion_item.documentation then
					local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
					if r then
						local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
						local group = "Tw_" .. color
						if vim.fn.hlID(group) < 1 then
							vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
						end
						vim_item.kind = "●"
						vim_item.kind_hl_group = group
					end
				else
					vim_item.kind = kind_icons[vim_item.kind]
				end
				vim_item.menu = ({
					nvim_lsp = "LSP",
					luasnip = "Snip",
					codeium = "Codeium",
					buffer = "Buffer",
					path = "Path",
					emoji = "Emoji",
				})[entry.source.name]
				return vim_item
			end,
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "luasnip" },
			{ name = "codeium" },
			{ name = "buffer" },
			{ name = "path" },
		},

		confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = true },
		experimental = { ghost_text = true },
	})
end

local function load_null_ls()
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

local function load_dap()
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

local function load_gitsigns()
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

		on_attach = function(bufnr)
			if pcall(require, "which-key") then
				require("which-key").register({
					g = { name = "Git" },
				}, { prefix = "<leader>" })
			end

			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- Actions
			map("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
			map("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
			map("v", "<leader>gs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { buffer = bufnr, desc = "Stage Hunk" })
			map("v", "<leader>gr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { buffer = bufnr, desc = "Reset Hunk" })
			map("n", "<leader>gS", gs.stage_buffer, { buffer = bufnr, desc = "Stage Buffer" })
			map("n", "<leader>gu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo Stage Buffer" })
			map("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
			map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { buffer = bufnr, desc = "Blame" })
			map("n", "<leader>gb", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle Blame" })
			map("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Diff" })
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { buffer = bufnr, desc = "Diff ~" })
			map("n", "<leader>gd", gs.toggle_deleted, { buffer = bufnr, desc = "Toggle Deleted" })

			map("n", "<leader>go", "<cmd>Telescope git_status<cr>", { buffer = bufnr, desc = "Open changed file" })
			map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { buffer = bufnr, desc = "Checkout branch" })
			map("n", "<leader>gb", "<cmd>Telescope git_commits<cr>", { buffer = bufnr, desc = "Checkout commit" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr, desc = "Select Hunk" })
		end,
	})
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
			"catppuccin/nvim",
			lazy = false,
			priority = 1000,
			config = function()
				pcall(vim.cmd.colorscheme, "catppuccin")
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
		{
			"numToStr/Comment.nvim",
			lazy = true,
			config = function()
				load_comment()
			end,
			dependencies = {
				{
					"JoosepAlviste/nvim-ts-context-commentstring",
					event = "VeryLazy",
				},
			},
		},
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
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			config = function()
				local wk = require("which-key")
				wk.register({
					f = { name = "Find" },
					p = {
						name = "Plugins",
						i = { "<cmd>Lazy install<cr>", "Install" },
						s = { "<cmd>Lazy sync<cr>", "Sync" },
						S = { "<cmd>Lazy clear<cr>", "Status" },
						c = { "<cmd>Lazy clean<cr>", "Clean" },
						u = { "<cmd>Lazy update<cr>", "Update" },
						p = { "<cmd>Lazy profile<cr>", "Profile" },
						l = { "<cmd>Lazy log<cr>", "Log" },
						d = { "<cmd>Lazy debug<cr>", "Debug" },
					},
					s = {
						name = "Search",
						b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
						c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
						f = { "<cmd>Telescope find_files<cr>", "Find File" },
						h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
						H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
						M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
						r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
						R = { "<cmd>Telescope registers<cr>", "Registers" },
						t = { "<cmd>Telescope live_grep<cr>", "Text" },
						k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
						C = { "<cmd>Telescope commands<cr>", "Commands" },
						l = { "<cmd>Telescope resume<cr>", "Resume last search" },
						p = {
							"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
							"Colorscheme with Preview",
						},
					},
				}, { prefix = "<leader>" })
			end,
		},
		{
			"NvChad/nvim-colorizer.lua",
			event = "BufReadPost",
			config = function()
				require("colorizer").setup({
					user_default_options = {
						RRGGBBAA = true,
						AARRGGBB = true,
						css = true,
						tailwind = true,
						sass = { enable = true, parsers = { "css" } },
					},
				})
			end,
		},
		{
			"lewis6991/gitsigns.nvim",
			event = "VeryLazy",
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
				"jcdickinson/codeium.nvim",
			},
			config = function()
				load_cmp()
			end,
		},
		{
			"williamboman/mason.nvim",
			dependencies = { "williamboman/mason-lspconfig.nvim", { "neovim/nvim-lspconfig", lazy = true } },
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
