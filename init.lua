-- Keymaps
local keymap = vim.keymap.set
vim.g.mapleader = " "

keymap("n", "<S-G>", "<S-G>zz", { desc = "Goto last line" })
keymap("n", "<C-U>", "<C-U>zz", { desc = "Half page up" })
keymap("n", "<C-D>", "<C-D>zz", { desc = "Half page down" })
keymap("n", "<C-B>", "<C-B>zz", { desc = "Page up" })
keymap("n", "<C-F>", "<C-F>zz", { desc = "Page down" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "(v:searchforward ? 'nzzzv' : 'Nzzzv')", { expr = true, desc = "Next search result" })
keymap("n", "N", "(v:searchforward ? 'Nzzzv' : 'nzzzv')", { expr = true, desc = "Prev search result" })

keymap("n", "J", "mzJ`z", { desc = "Join lines" })
keymap("i", "<C-H>", "<C-W>", { desc = "Delete previous word" })
keymap("i", "<C-Del>", "<C-O>dw", { desc = "Detele next word" })

-- Add undo break-points
keymap("i", ",", ",<C-G>u")
keymap("i", ".", ".<C-G>u")
keymap("i", ";", ";<C-G>u")

keymap("n", "<C-H>", "<C-W>h", { desc = "Goto left window" })
keymap("n", "<C-J>", "<C-W>j", { desc = "Goto lower window" })
keymap("n", "<C-K>", "<C-W>k", { desc = "Goto upper window" })
keymap("n", "<C-L>", "<C-W>l", { desc = "Goto right window" })

keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

keymap({ "n", "v", "i" }, "<C-S>", "<cmd>w<CR>", { desc = "Save" })
keymap({ "n", "v" }, "<leader>s", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })
keymap("n", "<leader>S", "<cmd>wa<CR>", { desc = "Save all" })
keymap("n", "<S-Q>", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap({ "n", "i" }, "<C-Q>", "<cmd>q<CR>", { desc = "Close window" })
keymap("n", "<leader>q", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
keymap("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Close all windows" })

keymap("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

keymap("t", "<Esc>", "<C-Bslash><C-N>", { desc = "Return to normal mode" })
keymap("n", "<C-Bslash>", "<cmd>sp term://$SHELL<CR><cmd>resize -8<CR>i", { desc = "Open terminal" })

keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })
keymap("n", "<A-j>", "<cmd>m.+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m.-2<CR>==", { desc = "Move line up" })
keymap("i", "<A-j>", "<Esc><cmd>m.+1<CR>==gi", { desc = "Move line down" })
keymap("i", "<A-k>", "<Esc><cmd>m.-2<CR>==gi", { desc = "Move line up" })
keymap("v", "<A-j>", ":m'>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
keymap("v", "<A-k>", ":m'<-2<CR>gv=gv", { silent = true, desc = "Move line up" })

keymap("v", "p", "P", { desc = "Paste" })
keymap({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to clipboard" })
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })

keymap("n", "gl", vim.diagnostic.open_float, { desc = "Float" })
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Comment line" })
keymap(
	"x",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Comment block" }
)

local function toggle_search()
	if vim.g.search_hl then
		vim.cmd("nohlsearch")
		vim.g.search_hl = false
	else
		vim.cmd("set hlsearch")
		vim.g.search_hl = true
	end
end
-- stylua: ignore
keymap("n", "<Esc><Esc>", function() toggle_search() end, { desc = "Toggle search highlight" })
keymap({ "n", "v" }, "/", "<cmd>lua vim.g.search_hl = true<CR>/", { desc = "Search" })

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
vim.opt.shiftround = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 20
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.pumwidth = 3
vim.opt.confirm = true
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "none"
vim.opt.splitkeep = "screen"
vim.opt.spelllang = { "en_us", "pt_br" }
vim.opt.wildmode = "longest:full,full"
vim.opt.listchars:append("tab:  ▷,extends:»,precedes:«,lead: ,trail:·,multispace:·,nbsp:⣿")
vim.opt.fillchars:append("eob: ")
vim.cmd("aunmenu PopUp")

-- Autocommands
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	command = "checktime|rshada|wshada",
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

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		keymap("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true, nowait = true })
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local exclude = { "diff", "gitcommit" }
		local buf = vim.api.nvim_get_current_buf()
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local function lsp_format(async, bufnr)
	async = async or false
	vim.lsp.buf.format({
		filter = function(client)
			local exclude = { "cssls", "jsonls", "tsserver" }
			if vim.tbl_contains(exclude, client.name) then
				return false
			end
			return true
		end,
		async = async,
		bufnr = bufnr,
	})
end

local format_on_save = true
local function toggle_format_on_save()
	format_on_save = not format_on_save
	local status = format_on_save and "enabled" or "disabled"
	print("Format on save was " .. status)
end

local remove_comments_on_save = true
local function toggle_remove_comments_on_save()
	remove_comments_on_save = not remove_comments_on_save
	local status = remove_comments_on_save and "enabled" or "disabled"
	print("Remove empty comments on save was " .. status)
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		local exclude = { "diff" }
		local exclude_fmt_on_save = { "tsconfig.json" }
		local buf = vim.api.nvim_get_current_buf()
		local ft = vim.bo[buf].filetype

		if vim.tbl_contains(exclude, ft) then
			return
		end

		local pos = vim.api.nvim_win_get_cursor(0)

		-- Trim whitespaces
		if ft ~= "markdown" then
			vim.cmd([[:silent %s/\s\+$//e]])
		end

		-- Remove empty comments (# % ;; -- //)
		if remove_comments_on_save then
			-- Don't remove `;;` in `sh` files as it can be used as an operator for `case`
			if ft:find("sh") then
				vim.cmd([[:silent %s/\(^\|^\s\{}\)\(#\|%\|--\|\/\/\)$//e]])
			else
				vim.cmd([[:silent %s/\(^\|^\s\{}\)\(#\|%\|;;\|--\|\/\/\)$//e]])
			end
		end

		-- Trim empty lines at eof
		vim.cmd([[:silent! %s#\($\n\s*\)\+\%$##]])

		if format_on_save then
			local bufname = vim.api.nvim_buf_get_name(buf)
			for _, e in pairs(exclude_fmt_on_save) do
				if bufname:find(e) then
					return
				end
			end
			lsp_format()
		end

		pcall(vim.api.nvim_win_set_cursor, 0, pos)
	end,
})

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

local darkTheme = "nightfox"
local lightTheme = "dayfox"

local function setDarkTheme()
	pcall(vim.cmd.colorscheme, darkTheme)
	pcall(vim.cmd.colorscheme, darkTheme)
	if pcall(require, "lualine") then
		require("lualine").setup({ options = { theme = darkTheme } })
	end
end

local function setLightTheme()
	pcall(vim.cmd.colorscheme, lightTheme)
	pcall(vim.cmd.colorscheme, lightTheme)
	if pcall(require, "lualine") then
		require("lualine").setup({ options = { theme = lightTheme } })
	end
end

local function toggleTheme()
	if vim.opt.background:get() == "dark" then
		setLightTheme()
	else
		setDarkTheme()
	end
end

vim.opt.rtp:prepend(lazypath)
if pcall(require, "lazy") then
	require("lazy").setup({
		{
			"EdenEast/nightfox.nvim",
			name = "nightfox",
			lazy = false,
			priority = 1000,
			opts = {
				palettes = { nightfox = { bg1 = "#151f2c", bg3 = "#1c293a" }, dayfox = { bg3 = "#eeeaea" } },
				groups = {
					nightfox = { Whitespace = { fg = "#4e616e" }, GitSignsCurrentLineBlame = { fg = "#4e616e" } },
					dayfox = { Whitespace = { fg = "#bec1ce" } },
				},
			},
		},

		{
			"vimpostor/vim-lumen",
			init = function()
				vim.api.nvim_create_autocmd("User", {
					pattern = "LumenLight",
					callback = function()
						local currentTheme = vim.api.nvim_exec2("colorscheme", { output = true }).output
						if currentTheme == lightTheme then
							return
						end
						setLightTheme()
					end,
				})

				vim.api.nvim_create_autocmd("User", {
					pattern = "LumenDark",
					callback = function()
						local currentTheme = vim.api.nvim_exec2("colorscheme", { output = true }).output
						if currentTheme == darkTheme then
							return
						end
						setDarkTheme()
					end,
				})
			end,
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			init = function()
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp_status_ok, cmp = pcall(require, "cmp")
				if not cmp_status_ok then
					return
				end
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
			opts = {
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
				},
			},
		},

		{
			"hrsh7th/nvim-cmp",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"roobert/tailwindcss-colorizer-cmp.nvim",
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
				{
					"L3MON4D3/LuaSnip",
					build = "make install_jsregexp",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
						local ls = require("luasnip")

						keymap({ "i", "s" }, "<C-J>", function()
							if ls.expand_or_jumpable() then
								ls.expand_or_jump()
							end
						end, { desc = "Snip expand or jump" })
						keymap({ "i", "s" }, "<C-K>", function()
							if ls.jumpable(-1) then
								ls.jump(-1)
							end
						end, { desc = "Snip jump backwards" })
						keymap({ "i", "s" }, "<C-L>", function()
							if ls.choice_active() then
								ls.change_choice(1)
							end
						end, { desc = "Snip choice" })

						vim.api.nvim_create_autocmd("ModeChanged", {
							group = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true }),
							pattern = { "s:n", "i:*" },
							callback = function(event)
								if
									ls.session
									and ls.session.current_nodes[event.buf]
									and not ls.session.jump_active
								then
									ls.unlink_current()
								end
							end,
						})

						ls.setup({ history = true, update_events = { "TextChanged", "TextChangedI" } })
					end,
				},
				{
					"Exafunction/codeium.nvim",
					config = function()
						local _, filesize = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
						filesize = filesize and filesize.size or 0
						if filesize <= 127830 then
							require("codeium").setup({
								config_path = vim.fn.stdpath("config") .. "/codeium/config.json",
							})
						end
					end,
				},
			},
			config = function()
				vim.opt.completeopt = { "menuone", "noselect" }

				local kind_icons = {
					Text = "󰉿",
					Method = "m",
					Function = "󰊕",
					Constructor = "",
					Field = "",
					Variable = "󰆧",
					Class = "󰌗",
					Interface = "",
					Module = "",
					Property = "",
					Unit = "",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰇽",
					Struct = "",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "󰊄",
					Codeium = "󰚩",
					Copilot = "",
				}

				local has_words_before = function()
					unpack = unpack or table.unpack
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and not vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
				end

				local cmp = require("cmp")
				local ls = require("luasnip")

				cmp.setup({
					snippet = {
						expand = function(args)
							ls.lsp_expand(args.body)
						end,
					},

					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},

					mapping = cmp.mapping.preset.insert({
						["<C-U>"] = cmp.mapping.scroll_docs(-3),
						["<C-D>"] = cmp.mapping.scroll_docs(3),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-C>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
							elseif ls.expandable() then
								ls.expand()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
							else
								fallback()
							end
						end, { "i", "s" }),
					}),

					formatting = {
						fields = { "kind", "abbr", "menu" },

						format = function(entry, vim_item)
							if vim_item.kind == "Color" and entry.completion_item.documentation then
								local _, _, r, g, b =
									string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
								if r then
									local color = string.format("%02x", r)
										.. string.format("%02x", g)
										.. string.format("%02x", b)
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

					confirm_opts = { select = true },
					experimental = { ghost_text = true },
				})
			end,
		},

		{
			"numToStr/Comment.nvim",
			event = "VeryLazy",
			dependencies = {
				{
					"JoosepAlviste/nvim-ts-context-commentstring",
					event = "VeryLazy",
					init = function()
						vim.g.skip_ts_context_commentstring_module = true
					end,
					opts = { enable_autocmd = false },
				},
			},
			opts = {
				ignore = "^(%s*)$",
				pre_hook = function(ctx)
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
				end,
			},
		},

		{
			"NvChad/nvim-colorizer.lua",
			event = { "BufReadPost", "BufNewFile" },
			opts = {
				filetypes = { "*", "!mason", "!lazy" },
				user_default_options = {
					RRGGBBAA = true,
					AARRGGBB = true,
					css = true,
					tailwind = true,
					sass = { enable = true, parsers = { "css" } },
				},
			},
		},

		{
			"rcarriga/nvim-dap-ui",
			lazy = true,
			dependencies = {
				"mfussenegger/nvim-dap",
				init = function()
					vim.fn.sign_define(
						"DapBreakpoint",
						{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
					)
					require("dap").listeners.after.event_initialized["dapui_config"] = function()
						require("dapui").open()
					end
					require("dap").listeners.before.event_terminated["dapui_config"] = function()
						require("dapui").close()
					end
					require("dap").listeners.before.event_exited["dapui_config"] = function()
						require("dapui").close()
					end
				end,
			},
			opts = {
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
			},
		},

		{
			"jinh0/eyeliner.nvim",
			event = "VeryLazy",
			opts = {
				highlight_on_key = true,
				dim = true,
			},
		},

		{
			"nvim-lualine/lualine.nvim",
			event = "VeryLazy",
			opts = function()
				local hide_section = function()
					local width = vim.fn.winwidth(0)
					local buffers = vim.api.nvim_exec2(
						"echo len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))",
						{ output = true }
					)
					buffers = tonumber(buffers.output)

					local cond1 = width < 100
					local cond2 = buffers and buffers > 7
					local cond3 = buffers and buffers > 4 and width < 150

					if cond1 or cond2 or cond3 then
						return false
					end
					return true
				end

				local diagnostics = {
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "hint", "info" },
					symbols = { error = " ", warn = " ", hint = " ", info = " " },
					always_visible = false,
				}

				local diff = {
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
					cond = hide_section,
				}

				local buffers = {
					"buffers",
					icons_enabled = false,
					icon = { align = "left" },
					symbols = { alternate_file = "" },
				}

				local navic = {
					function()
						return require("nvim-navic").get_location()
					end,
					cond = function()
						return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
					end,
					draw_empty = true,
				}

				require("lualine").setup({
					options = { globalstatus = true, section_separators = "", component_separators = "" },
					winbar = {
						lualine_c = {
							{
								"filename",
								path = 1,
								symbols = { modified = "●", readonly = "", unnamed = "" },
								cond = function()
									local buf = vim.api.nvim_get_current_buf()
									return vim.api.nvim_buf_get_option(buf, "filetype") ~= "NvimTree"
								end,
							},
							navic,
						},
					},
					sections = {
						lualine_a = {
							{
								"mode",
								fmt = function(str)
									if hide_section() then
										return str
									end
									return str:sub(1, 1)
								end,
							},
						},
						lualine_b = { "branch" },
						lualine_c = { diagnostics, "%=", buffers },
						lualine_x = {
							diff,
							"filetype",
							{
								function()
									return "  " .. require("dap").status()
								end,
								cond = function()
									return package.loaded["dap"] and require("dap").status() ~= ""
								end,
							},
							{ require("lazy.status").updates, cond = require("lazy.status").has_updates },
						},
						lualine_y = { { "location", cond = hide_section } },
						lualine_z = { "progress" },
					},
				})
			end,
		},

		{
			"RRethy/vim-illuminate",
			event = { "BufReadPost", "BufNewFile" },
			opts = {
				delay = 200,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
				filetypes_denylist = {
					"neo-tree",
					"NvimTree",
					"lazy",
					"mason",
				},
				under_cursor = false,
			},
			config = function(_, opts)
				require("illuminate").configure(opts)

				local function map(key, dir, buffer)
					vim.keymap.set("n", key, function()
						require("illuminate")["goto_" .. dir .. "_reference"](false)
					end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
				end

				map("]]", "next")
				map("[[", "prev")

				-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
				vim.api.nvim_create_autocmd("FileType", {
					callback = function()
						local buffer = vim.api.nvim_get_current_buf()
						map("]]", "next", buffer)
						map("[[", "prev", buffer)
					end,
				})
			end,
			keys = {
				{ "]]", desc = "Next Reference" },
				{ "[[", desc = "Prev Reference" },
			},
		},

		{
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufReadPost", "BufNewFile" },
			main = "ibl",
			opts = {
				indent = { char = "│", tab_char = "│" },
				scope = { enabled = true, show_start = false, show_end = false },
			},
		},

		{
			"echasnovski/mini.indentscope",
			event = { "BufReadPre", "BufNewFile" },
			opts = {
				symbol = "│",
				options = { try_as_border = true },
			},
			init = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"NvimTree",
						"Trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
					callback = function()
						vim.b.miniindentscope_disable = true
					end,
				})
			end,
		},

		{
			"lewis6991/gitsigns.nvim",
			event = { "BufReadPre", "BufNewFile" },
			opts = {
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
						text = "󰐊",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "󰐊",
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
						local gs = package.loaded.gitsigns

						require("which-key").register({
							g = {
								name = "Git",
								j = {
									"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>",
									"Next hunk",
								},
								k = {
									"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>",
									"Prev hunk",
								},
								l = {
									function()
										gs.blame_line({ full = true })
									end,
									"Blame",
								},
								L = { gs.toggle_current_line_blame, "Toggle blame" },
								p = { gs.preview_hunk, "Preview hunk" },
								r = { gs.reset_hunk, "Reset hunk" },
								R = { gs.reset_buffer, "Reset buffer" },
								S = { gs.stage_buffer, "Stage buffer" },
								s = { gs.stage_hunk, "Stage hunk" },
								u = { gs.undo_stage_hunk, "Undo stage hunk" },

								d = { gs.diffthis, "Diff" },
								D = {
									function()
										gs.diffthis("origin")
									end,
									"Diff origin",
								},
								t = { gs.toggle_deleted, "Toggle Deleted" },

								o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
								b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
								c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
								C = {
									"<cmd>Telescope git_bcommits<CR>",
									"Checkout commit(for current file)",
								},
							},
						}, { prefix = "<leader>", buffer = bufnr })

						require("which-key").register({
							g = {
								name = "Git",
								h = { ":<C-U>Gitsigns select_hunk<CR>", "Select hunk" },
								s = {
									function()
										gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
									end,
									"Stage Hunk",
								},
								r = {
									function()
										gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
									end,
									"Reset Hunk",
								},
							},
						}, { mode = { "o", "x" }, prefix = "<leader>", buffer = bufnr })
					end
				end,
			},
		},

		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{
					"williamboman/mason.nvim",
					build = ":MasonUpdate",
					init = function()
						local packages = {
							"black",
							"flake8",
							"prettier",
							"shellcheck",
							"stylua",
						}

						local installed_packages = require("mason-registry").get_installed_package_names()
						for _, v in pairs(packages) do
							if not vim.tbl_contains(installed_packages, v) then
								vim.cmd("MasonInstall " .. v)
							end
						end
					end,
					opts = {},
				},
				{
					"williamboman/mason-lspconfig.nvim",
					build = ":MasonUpdate",
					opts = {
						ensure_installed = {
							"bashls",
							"cssls",
							"eslint",
							"html",
							"jsonls",
							"lua_ls",
							"pyright",
							"tailwindcss",
							"tsserver",
							"yamlls",
						},
						automatic_installation = true,
					},
				},
			},
			init = function()
				local signs = {
					{ name = "DiagnosticSignError", text = "" },
					{ name = "DiagnosticSignWarn", text = "" },
					{ name = "DiagnosticSignHint", text = "" },
					{ name = "DiagnosticSignInfo", text = "" },
				}

				local virtual_text
				local function toggle_virtual_text()
					virtual_text = not virtual_text and { prefix = "●" } or false
					vim.diagnostic.config({ virtual_text = virtual_text })
					local status = virtual_text and "enabled" or "disabled"
					print("Virtual text was " .. status)
				end
				keymap("n", "<leader>lv", toggle_virtual_text, { desc = "Toggle virtual text" })

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

				for _, sign in ipairs(signs) do
					vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
				end

				vim.diagnostic.config(config)
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
				vim.lsp.handlers["textDocument/signatureHelp"] =
					vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			end,
			config = function()
				local function lsp_keymaps(bufnr)
					if pcall(require, "which-key") then
						require("which-key").register({
							K = { vim.lsp.buf.hover, "Hover" },
							g = {
								name = "Goto",
								d = { vim.lsp.buf.definition, "Definition" },
								D = { vim.lsp.buf.declaration, "Declaration" },
								i = { vim.lsp.buf.implementation, "Implementation" },
								r = { vim.lsp.buf.references, "References" },
							},
						}, { buffer = bufnr })

						require("which-key").register({
							l = {
								name = "LSP",
								r = { vim.lsp.buf.rename, "Rename" },
								h = { vim.lsp.buf.signature_help, "Signature Help" },
								a = { vim.lsp.buf.code_action, "Code Action" },
								A = { vim.lsp.codelens.run, "CodeLens Action" },
								q = { vim.diagnostic.setloclist, "Quickfix" },
								Q = { "<cmd>Telescope quickfix<CR>", "Telescope Quickfix" },
								s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
								S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
								d = { vim.lsp.buf.type_definition, "Type Definition" },
								j = { vim.diagnostic.goto_next, "Next Diagnostic" },
								k = { vim.diagnostic.goto_prev, "Previous Diagnostic" },
								w = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
								b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Buffer Diagnostics" },
								W = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
								F = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
								R = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
								l = {
									function()
										print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
									end,
									"List Workspace Folders",
								},
							},

							d = {
								name = "Debug",
								t = { '<cmd>lua require("dap").toggle_breakpoint()<CR>', "Toggle Breakpoint" },
								b = { '<cmd>lua require("dap").step_back()<CR>', "Step Back" },
								c = { '<cmd>lua require("dap").continue()<CR>', "Continue" },
								C = { '<cmd>lua require("dap").run_to_cursor()<CR>', "Run to Cursor" },
								d = { '<cmd>lua require("dap").disconnect()<CR>', "Disconnect" },
								g = { '<cmd>lua require("dap").session()<CR>', "Get Session" },
								i = { '<cmd>lua require("dap").step_into()<CR>', "Step Into" },
								o = { '<cmd>lua require("dap").step_over()<CR>', "Step Over" },
								u = { '<cmd>lua require("dap").step_out()<CR>', "Step Out" },
								p = { '<cmd>lua require("dap").pause()<CR>', "Pause" },
								r = { '<cmd>lua require("dap").repl.toggle()<CR>', "Toggle REPL" },
								q = { '<cmd>lua require("dap").close()<CR>', "Quit" },
								U = { '<cmd>lua require("dapui").toggle({reset = true})<CR>', "Dap UI" },
								B = {
									"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
									"Breakpoint Condition",
								},
								e = { '<cmd>lua require("dap").goto_()<CR>', "Go to line (no execute)" },
								v = { '<cmd>lua require("dapui").eval()<CR>', "Eval" },
								w = { '<cmd>lua require("dap.ui.widgets").hover()<CR>', "Widgets" },
								l = { '<cmd>lua require("dap").run_last()<CR>', "Run Last" },
								T = { '<cmd>lua require("dap").terminate()<CR>', "Terminate" },
								j = { '<cmd>lua require("dap").down()<CR>', "Down" },
								k = { '<cmd>lua require("dap").up()<CR>', "Up" },
							},
						}, { prefix = "<leader>", buffer = bufnr })
					end
				end

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}

				local on_attach = function(client, bufnr)
					if client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, bufnr)
					end

					if client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end

					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
					lsp_keymaps(bufnr)
				end

				for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
					server = vim.split(server, "@")[1]

					local opts = {
						on_attach = on_attach,
						capabilities = capabilities,
					}

					if server == "eslint" then
						opts.settings = {
							workingDirectory = { mode = "auto" },
						}

						local util = require("lspconfig/util")
						if util.path.exists("node_modules/eslint") then
							return
						end

						local node_path = util.find_node_modules_ancestor(vim.fn.expand("%:p:h"))
						if node_path and util.path.exists(node_path .. "/node_modules/eslint") then
							return
						end

						local git_path = util.find_git_ancestor(vim.fn.expand("%:p:h"))
						if git_path and util.path.exists(git_path .. "/node_modules/eslint") then
							return
						end

						local eslint_path = vim.fn.system("command -v eslint")
						eslint_path = eslint_path:gsub("bin/eslint", "lib/node_modules")
						eslint_path = eslint_path:gsub("%s+", "")
						opts.settings = {
							nodePath = eslint_path,
						}
					end

					if server == "lua_ls" then
						opts.settings = {
							Lua = {
								format = {
									enable = false,
									defaultConfig = { quote_style = "double" },
								},
								diagnostics = { globals = { "vim", "mp" } },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
							},
						}
					end

					if server == "tailwindcss" then
						opts.root_dir = function(fname)
							local util = require("lspconfig/util")
							return util.root_pattern(
								"tailwind.config.js",
								"tailwind.config.ts",
								"tailwind.config.cjs",
								"tailwind.config.mjs",
								"tailwind.js",
								"tailwind.ts",
								"tailwind.cjs",
								"tailwind.mjs"
							)(fname)
						end
					end

					require("lspconfig")[server].setup(opts)
				end
			end,
		},

		{
			"SmiteshP/nvim-navic",
			lazy = true,
			init = function()
				vim.g.navic_silence = true
			end,
			opts = function()
				return {
					separator = " ",
					highlight = true,
					depth_limit = 5,
				}
			end,
		},

		{
			"nvim-tree/nvim-tree.lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			init = function()
				vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1
			end,
			opts = {
				disable_netrw = true,
				sort = {
					sorter = function(nodes)
						local function natural_cmp(left, right)
							if left.type == "link" then
								local is_dir = vim.fn.isdirectory(left.name) == 1
								-- stylua: ignore
								if is_dir then left.type = "directory" else left.type = "file" end
							end
							if right.type == "link" then
								local is_dir = vim.fn.isdirectory(right.name) == 1
								-- stylua: ignore
								if is_dir then right.type = "directory" else right.type = "file" end
							end

							if left.type ~= right.type then
								return left.type < right.type
							end

							left = left.name:lower()
							right = right.name:lower()

							if left == right then
								return false
							end

							for i = 1, math.max(string.len(left), string.len(right)), 1 do
								local l = string.sub(left, i, -1)
								local r = string.sub(right, i, -1)

								if
									type(tonumber(string.sub(l, 1, 1))) == "number"
									and type(tonumber(string.sub(r, 1, 1))) == "number"
								then
									local l_number = tonumber(string.match(l, "^[0-9]+"))
									local r_number = tonumber(string.match(r, "^[0-9]+"))

									if l_number ~= r_number then
										return l_number < r_number
									end
								elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
									return l < r
								end
							end
						end

						table.sort(nodes, natural_cmp)
					end,
				},
				renderer = {
					group_empty = true,
					special_files = {},
					highlight_diagnostics = true,
					symlink_destination = false,
					indent_markers = { enable = true },
					icons = {
						git_placement = "after",
						show = {
							folder = false,
							folder_arrow = true,
						},
						glyphs = {
							git = {
								untracked = "",
								unstaged = "",
							},
						},
					},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
				},
				filters = {
					git_ignored = true,
					custom = { "^.git$", "^node_modules$", "^.vscode$" },
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			},
		},

		{
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			opts = {},
		},

		{
			"nvimtools/none-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			opts = function()
				require("null-ls").setup({
					debug = false,
					sources = {
						require("null-ls").builtins.diagnostics.flake8.with({
							extra_args = { "--max-line-length=88", "--extend-ignore=E203" },
						}),
						require("null-ls").builtins.code_actions.shellcheck,
						require("null-ls").builtins.diagnostics.zsh,
						require("null-ls").builtins.formatting.stylua,
						require("null-ls").builtins.formatting.google_java_format,
						require("null-ls").builtins.formatting.black.with({ extra_args = { "--fast", "--preview" } }),
						require("null-ls").builtins.formatting.prettier.with({
							extra_filetypes = { "toml" },
							extra_args = function()
								local prettier_jsonc_args = {
									"--parser",
									"jsonc",
									"--trailing-comma",
									"none",
								}
								local prettier_args = {
									"--config-precedence=file-override",
									"--no-semi",
									"--single-quote",
									"--jsx-single-quote",
								}
								local buf = vim.api.nvim_get_current_buf()
								local ft = vim.bo[buf].filetype
								if ft == "jsonc" then
									for _, v in ipairs(prettier_jsonc_args) do
										table.insert(prettier_args, v)
									end
								end
								return prettier_args
							end,
						}),
					},
				})
			end,
		},

		{
			"folke/persistence.nvim",
			event = "BufReadPre",
			opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
			-- stylua: ignore
			keys = {
				{ "<leader>rs", function() require("persistence").load() end, desc = "Restore Session" },
				{ "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
				{ "<leader>rd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
			},
		},

		{
			"nvim-telescope/telescope.nvim",
			event = "VeryLazy",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"debugloop/telescope-undo.nvim",
				{
					"ahmedkhalf/project.nvim",
					name = "project_nvim",
					opts = {
						detection_methods = { "pattern" },
						patterns = { ".git", "Makefile", "package.json" },
					},
				},
			},
			config = function()
				require("telescope").setup({
					defaults = { path_display = { "smart" }, file_ignore_patterns = { ".git/", "node_modules" } },
					pickers = {
						find_files = { hidden = true, no_ignore = false },
					},
					extensions = {
						undo = {
							mappings = {
								i = {
									["<C-CR>"] = require("telescope-undo.actions").yank_additions,
									["<S-CR>"] = require("telescope-undo.actions").yank_deletions,
									["<CR>"] = require("telescope-undo.actions").restore,
								},
								n = {
									["y"] = require("telescope-undo.actions").yank_additions,
									["Y"] = require("telescope-undo.actions").yank_deletions,
									["<CR>"] = require("telescope-undo.actions").restore,
								},
							},
						},
					},
				})
				require("telescope").load_extension("projects")
				require("telescope").load_extension("undo")
			end,
		},

		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {},
			-- stylua: ignore
			keys = {
				{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment", },
				{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment", },
			},
		},

		{
			"nvim-treesitter/nvim-treesitter",
			event = { "BufReadPost", "BufNewFile" },
			build = ":TSUpdate",
			init = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
			cmd = { "TSUpdateSync" },
			opts = function()
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
						"tsx",
						"typescript",
						"yaml",
					},
					sync_install = false,
					auto_install = false,
					modules = {},
					ignore_install = {},
					highlight = { enable = true, additional_vim_regex_highlighting = false },
					autopairs = { enable = true },
					indent = { enable = true },
					incremental_selection = {
						enable = true,
						keymaps = {
							node_incremental = "v",
							node_decremental = "<BS>",
						},
					},
				})
			end,
		},

		{
			"kevinhwang91/nvim-ufo",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"kevinhwang91/promise-async",
			},
			init = function()
				vim.o.foldlevel = 99
				vim.o.foldlevelstart = 99
				vim.o.foldenable = true
				keymap("n", "zR", require("ufo").openAllFolds)
				keymap("n", "zM", require("ufo").closeAllFolds)
			end,
			opts = {},
		},

		{
			"folke/which-key.nvim",
			lazy = false,
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			config = function()
				require("which-key").register({
					e = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
					f = {
						name = "Find",
						b = { "<cmd>Telescope buffers<CR>", "Buffers" },
						c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
						C = { "<cmd>Telescope commands<CR>", "Commands" },
						e = { ":e %:h/<C-D>", "Edit file" },
						f = { "<cmd>Telescope find_files<CR>", "Find file" },
						F = { "<cmd>NvimTreeFindFileToggle<CR>", "Find file in NvimTree" },
						g = { "<cmd>Telescope live_grep<CR>", "Text" },
						h = { "<cmd>Telescope help_tags<CR>", "Help" },
						H = { "<cmd>Telescope highlights<CR>", "Highlight groups" },
						k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
						m = { "<cmd>Telescope man_pages<CR>", "Man pages" },
						p = { "<cmd>Telescope projects<CR>", "Projects" },
						P = {
							"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
							"Colorscheme with Preview",
						},
						r = { "<cmd>Telescope oldfiles<CR>", "Open recent file" },
						R = { "<cmd>Telescope registers<CR>", "Registers" },
						s = { "<cmd>Telescope resume<CR>", "Resume last search" },
						t = { "<cmd>TodoTelescope<CR>", "TODO" },
						u = { "<cmd>Telescope undo<CR>", "Undo tree" },
					},
					l = {
						name = "LSP",
						-- stylua: ignore
						f = { function() lsp_format(true) end, "Format", },
						t = { toggle_remove_comments_on_save, "Toggle remove empty comments on save" },
						T = { toggle_format_on_save, "Toggle format on save" },
					},
					r = {
						name = "Session",
					},
					t = {
						function()
							toggleTheme()
						end,
						"Toggle theme",
					},
					x = {
						name = "Plugins",
						l = {
							name = "Lazy",
							S = { "<cmd>Lazy<CR>", "Status" },
							i = { "<cmd>Lazy install<CR>", "Install" },
							u = { "<cmd>Lazy update<CR>", "Update" },
							s = { "<cmd>Lazy sync<CR>", "Sync" },
							x = { "<cmd>Lazy clean<CR>", "Clean" },
							c = { "<cmd>Lazy check<CR>", "Check" },
							l = { "<cmd>Lazy log<CR>", "Log" },
							r = { "<cmd>Lazy restore<CR>", "Restore" },
							p = { "<cmd>Lazy profile<CR>", "Profile" },
							d = { "<cmd>Lazy debug<CR>", "Debug" },
							h = { "<cmd>Lazy help<CR>", "Help" },
						},
						i = { "<cmd>LspInfo<CR>", "LSP Info" },
						m = { "<cmd>Mason<CR>", "Mason" },
						n = { "<cmd>NullLsInfo<CR>", "null-ls Info" },
						t = { "<cmd>TSUpdateSync<CR>", "Treesitter Update" },
					},
				}, { prefix = "<leader>" })
			end,
		},
	})
end
