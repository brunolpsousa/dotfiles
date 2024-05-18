-- Options
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
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
vim.opt.virtualedit = "block"
vim.opt.splitkeep = "screen"
vim.opt.spelllang = { "en_us", "pt_br" }
vim.opt.wildmode = "longest:full,full"
vim.opt.listchars:append("tab:  ▷,extends:»,precedes:«,lead: ,trail:·,multispace:·,nbsp:⣿")
vim.opt.fillchars:append("eob: ")
vim.cmd("aunmenu PopUp")

-- Functions
local map = vim.keymap.set

local function set_keys(key)
	for _, v in ipairs(key) do
		local mode = v.mode or "n"
		local lhs = v[1]
		local rhs = v[2]
		local opts = {
			buffer = v.buffer or nil,
			desc = v.desc or nil,
			expr = v.expr or nil,
			nowait = v.nowait or nil,
			silent = v.silent or nil,
		}
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

local dark_theme = "nightfox"
local light_theme = "dayfox"

local function set_dark_theme()
	pcall(vim.cmd.colorscheme, dark_theme)
	pcall(vim.cmd.colorscheme, dark_theme)
	if pcall(require, "lualine") then
		require("lualine").setup({ options = { theme = "auto" } })
	end
end

local function set_light_theme()
	pcall(vim.cmd.colorscheme, light_theme)
	pcall(vim.cmd.colorscheme, light_theme)
	if pcall(require, "lualine") then
		require("lualine").setup({ options = { theme = "auto" } })
	end
end

local function toggle_theme()
	if vim.opt.background:get() == "dark" then
		return set_light_theme()
	end
	set_dark_theme()
end

local function diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

-- TODO: remove
local function lsp_get_clients(opts)
	local ret = {}
	if vim.lsp.get_clients then
		vim.notify("Remove `lsp_get_clients`", 4)
		ret = vim.lsp.get_clients(opts)
	else
		ret = vim.lsp.get_active_clients(opts)
		if opts and opts.method then
			ret = vim.tbl_filter(function(client)
				return client.supports_method(opts.method, { bufnr = opts.bufnr })
			end, ret)
		end
	end
	return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

local function lsp_format(async)
	async = async ~= false
	local eslint = false

	for _, v in ipairs(lsp_get_clients()) do
		if v.name == "eslint" then
			async = false
			eslint = true
			break
		end
	end

	vim.lsp.buf.format({
		async = async,
		filter = function(client)
			local exclude = { "cssls", "jsonls", "tsserver" }
			return not vim.tbl_contains(exclude, client.name)
		end,
	})

	if eslint then
		vim.cmd("EslintFixAll")
	end
end

local function lsp_on_rename(from, to)
	for _, client in ipairs(lsp_get_clients()) do
		if client.supports_method("workspace/willRenameFiles") then
			local resp = client.request_sync("workspace/willRenameFiles", {
				files = {
					{
						oldUri = vim.uri_from_fname(from),
						newUri = vim.uri_from_fname(to),
					},
				},
			}, 1000, 0)
			if resp and resp.result then
				vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
			end
		end
	end
end

local function find_root(buf_id, names, fallback)
	local root_cache = {}
	buf_id = buf_id or 0
	names = names or { ".env", ".git", "node_modules", "Makefile" }
	fallback = fallback or function()
		return nil
	end

	local path = vim.api.nvim_buf_get_name(buf_id)
	if path == "" then
		return
	end
	local dir_path = vim.fs.dirname(path)

	local res = root_cache[dir_path]
	if res ~= nil then
		return res
	end

	-- Find root
	local root_file = vim.fs.find(names, { path = dir_path, upward = true })[1]
	if root_file ~= nil then
		res = vim.fs.dirname(root_file)
	else
		res = fallback(path)
	end

	-- Use absolute path to an existing directory
	if type(res) ~= "string" then
		return
	end
	res = vim.fn.fnamemodify(res, ":p")
	if vim.fn.isdirectory(res) == 0 then
		return
	end

	-- Cache result per directory path
	root_cache[dir_path] = res

	return res
end

local function set_root(data)
	local root = find_root(data.buf)
	if not root then
		return
	end
	vim.fn.chdir(root)
end

local format_on_save = true
local function toggle_format_on_save()
	format_on_save = not format_on_save
	local status = format_on_save and "enabled" or "disabled"
	vim.notify("Format on save was " .. status)
end

local remove_comments_on_save = true
local function toggle_remove_comments_on_save()
	remove_comments_on_save = not remove_comments_on_save
	local status = remove_comments_on_save and "enabled" or "disabled"
	vim.notify("Remove empty comments on save was " .. status)
end

local virtual_text
local function toggle_virtual_text()
	virtual_text = not virtual_text and { prefix = "●" } or false
	vim.diagnostic.config({ virtual_text = virtual_text })
	local status = virtual_text and "enabled" or "disabled"
	vim.notify("Virtual text was " .. status)
end

local function toggle_inlay_hints()
	local is_enabled = vim.lsp.inlay_hint.is_enabled({})
	local status = is_enabled and "enabled" or "disabled"
	vim.lsp.inlay_hint.enable(not is_enabled)
	vim.notify("inlayHints was " .. status)
end

local function toggle_search()
	if vim.g.search_hl then
		vim.cmd("nohlsearch")
		vim.g.search_hl = false
	else
		vim.cmd("set hlsearch")
		vim.g.search_hl = true
	end
end

local function toggle_indent_blankline()
	local _, ok = pcall(require, "ibl")
	if not ok then
		return
	end
	require("ibl").setup_buffer(0, {
		enabled = not require("ibl.config").get_config(0).enabled,
	})
end

-- Autocommands
vim.o.autochdir = false
vim.api.nvim_create_autocmd("BufEnter", { callback = set_root })

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
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"help",
		"lspinfo",
		"man",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		map("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true, nowait = true })
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

vim.api.nvim_create_autocmd("BufReadPost", {
	once = true,
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		local exclude = { "diff", "gitcommit", "gitrebase" }

		if vim.tbl_contains(exclude, vim.bo.filetype) then
			return
		end

		local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
		if cursor_line > 1 then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
			vim.cmd("normal! zz")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(ev)
		local exclude = { "diff" }
		local exclude_fmt_on_save = { "tsconfig.json" }
		local buf = ev.buf
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
			for _, e in ipairs(exclude_fmt_on_save) do
				if bufname:find(e) then
					goto restore_cursor
				end
			end
			lsp_format(false)
		end

		::restore_cursor::
		pcall(vim.api.nvim_win_set_cursor, 0, pos)
	end,
})

-- Keymaps
local keys = {
	{ "<S-G>", "<S-G>zz", desc = "Goto last line" },
	{ "<C-U>", "<C-U>zz", desc = "Half page up" },
	{ "<C-D>", "<C-D>zz", desc = "Half page down" },
	{ "<C-B>", "<C-B>zz", desc = "Page up" },
	{ "<C-F>", "<C-F>zz", desc = "Page down" },

	{ "<C-H>", "<C-W>h", desc = "Goto left window" },
	{ "<C-J>", "<C-W>j", desc = "Goto lower window" },
	{ "<C-K>", "<C-W>k", desc = "Goto upper window" },
	{ "<C-L>", "<C-W>l", desc = "Goto right window" },

	{ "<C-Up>", "<cmd>resize +2<CR>", desc = "Increase window height" },
	{ "<C-Down>", "<cmd>resize -2<CR>", desc = "Decrease window height" },
	{ "<C-Left>", "<cmd>vertical resize -2<CR>", desc = "Decrease window width" },
	{ "<C-Right>", "<cmd>vertical resize +2<CR>", desc = "Increase window width" },

	{ "<Tab>", "<cmd>bnext<CR>", desc = "Next buffer" },
	{ "<S-Tab>", "<cmd>bprevious<CR>", desc = "Previous buffer" },

	{ "<Esc>", "<C-Bslash><C-N>", mode = "t", desc = "Return to normal mode" },
	{ "<C-Bslash>", "<cmd>sp term://$SHELL<CR><cmd>resize -8<CR>i", desc = "Open terminal" },

	-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
	{ "n", "(v:searchforward ? 'nzzzv' : 'Nzzzv')", expr = true, desc = "Next search result" },
	{ "N", "(v:searchforward ? 'Nzzzv' : 'nzzzv')", expr = true, desc = "Prev search result" },
	{ "/", "<cmd>lua vim.g.search_hl = true<CR>/", mode = { "n", "v" }, desc = "Search" },
	{ "<Esc><Esc>", toggle_search, desc = "Toggle search highlight" },

	{ "J", "mzJ`z", desc = "Join lines" },
	{ "<C-H>", "<C-W>", mode = "i", desc = "Delete previous word" },
	{ "<C-Del>", "<C-O>dw", mode = "i", desc = "Detele next word" },

	-- Add undo break-points
	{ ",", ",<C-G>u", mode = "i" },
	{ ".", ".<C-G>u", mode = "i" },
	{ ";", ";<C-G>u", mode = "i" },

	{ "<C-S>", "<cmd>w<CR>", mode = { "n", "v", "i" }, desc = "Save" },
	{ "<leader>s", "<cmd>noautocmd w<CR>", mode = { "n", "v" }, desc = "Save without formatting" },
	{ "<leader>S", "<cmd>wa<CR>", desc = "Save all" },
	{ "<S-Q>", "<cmd>bd<CR>", desc = "Close buffer" },
	{ "<C-Q>", "<cmd>q<CR>", mode = { "n", "i" }, desc = "Close window" },
	{ "<leader>q", "<cmd>%bd|e#|bd#<CR>", desc = "Close all buffers except current" },
	{ "<leader>Q", "<cmd>qa<CR>", desc = "Close all windows" },

	{ "<", "<gv", mode = "v", desc = "Indent left" },
	{ ">", ">gv", mode = "v", desc = "Indent right" },
	{ "<A-j>", "<cmd>m.+1<CR>==", desc = "Move line down" },
	{ "<A-k>", "<cmd>m.-2<CR>==", desc = "Move line up" },
	{ "<A-j>", "<Esc><cmd>m.+1<CR>==gi", mode = "i", desc = "Move line down" },
	{ "<A-k>", "<Esc><cmd>m.-2<CR>==gi", mode = "i", desc = "Move line up" },
	{ "<A-j>", ":m'>+1<CR>gv=gv", mode = "v", desc = "Move line down", silent = true },
	{ "<A-k>", ":m'<-2<CR>gv=gv", mode = "v", desc = "Move line up", silent = true },

	{ "p", "P", mode = "v", desc = "Paste" },
	{ "<leader>d", '"+d', mode = { "n", "v" }, desc = "Delete to clipboard" },
	{ "<leader>y", '"+y', mode = { "n", "v" }, desc = "Yank to clipboard" },
	{ "<leader>p", '"+p', mode = { "n", "v" }, desc = "Paste from clipboard" },
	{ "<leader>P", '"+P', mode = { "n", "v" }, desc = "Paste from clipboard" },

	{ "<S-e>", ":e %:h/<C-D>", desc = "Edit file" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
	{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
	{ "<leader>fC", "<cmd>Telescope commands<CR>", desc = "Commands" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Text" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
	{ "<leader>fH", "<cmd>Telescope highlights<CR>", desc = "Highlight groups" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
	{ "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Man pages" },
	{ "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
	{ "<leader>fR", "<cmd>Telescope registers<CR>", desc = "Registers" },
	{ "<leader>fs", "<cmd>Telescope resume<CR>", desc = "Resume last search" },
	{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "TODO" },
	{ "<leader>fu", "<cmd>Telescope undo<CR>", desc = "Undo tree" },
	{
		"<leader>fP",
		"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
		desc = "Colorscheme with Preview",
	},

	{ "<leader>lf", lsp_format, desc = "Format", mode = { "n", "v" } },
	{ "<leader>li", toggle_indent_blankline, desc = "Toggle indent-blankline" },
	{ "<leader>lt", toggle_remove_comments_on_save, desc = "Toggle remove empty comments on save" },
	{ "<leader>lT", toggle_format_on_save, desc = "Toggle format on save" },
	{ "<leader>t", toggle_theme, desc = "Toggle theme" },

	{ "<leader>xlS", "<cmd>Lazy<CR>", desc = "Status" },
	{ "<leader>xli", "<cmd>Lazy install<CR>", desc = "Install" },
	{ "<leader>xlu", "<cmd>Lazy update<CR>", desc = "Update" },
	{ "<leader>xls", "<cmd>Lazy sync<CR>", desc = "Sync" },
	{ "<leader>xlx", "<cmd>Lazy clean<CR>", desc = "Clean" },
	{ "<leader>xlc", "<cmd>Lazy check<CR>", desc = "Check" },
	{ "<leader>xll", "<cmd>Lazy log<CR>", desc = "Log" },
	{ "<leader>xlr", "<cmd>Lazy restore<CR>", desc = "Restore" },
	{ "<leader>xlp", "<cmd>Lazy profile<CR>", desc = "Profile" },
	{ "<leader>xld", "<cmd>Lazy debug<CR>", desc = "Debug" },
	{ "<leader>xlh", "<cmd>Lazy help<CR>", desc = "Help" },

	{ "<leader>xi", "<cmd>LspInfo<CR>", desc = "LSP Info" },
	{ "<leader>xm", "<cmd>Mason<CR>", desc = "Mason" },
	{ "<leader>xn", "<cmd>NullLsInfo<CR>", desc = "null-ls Info" },
	{ "<leader>xt", "<cmd>TSUpdateSync<CR>", desc = "Treesitter Update" },

	{ "gl", vim.diagnostic.open_float, desc = "Float" },
	{ "<leader>lv", toggle_virtual_text, desc = "Toggle virtual text" },
	{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Comment line" },
	{ "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Comment line" },
	{
		"<leader>/",
		"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		mode = "x",
		desc = "Comment block",
	},
	{
		"<C-_>",
		"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		mode = "x",
		desc = "Comment block",
	},
}

local lsp_keys = {
	{ "K", vim.lsp.buf.hover, desc = "Hover" },
	{ "gD", vim.lsp.buf.declaration, desc = "Declaration" },
	{ "gr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
	{
		"gd",
		'<cmd> lua require("telescope.builtin").lsp_definitions({ reuse_win = true })<CR>',
		desc = "Definition",
	},
	{
		"gi",
		'<cmd>lua require("telescope.builtin").lsp_implementations({ reuse_win = true })<CR>',
		desc = "Implementation",
	},

	{ "<F2>", vim.lsp.buf.rename, desc = "Rename" },
	{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
	{ "[d", diagnostic_goto(false), desc = "Previous Diagnostic" },
	{ "]d", diagnostic_goto(true), desc = "Next Diagnostic" },
	{ "[e", diagnostic_goto(false, "ERROR"), desc = "Previous Error" },
	{ "]e", diagnostic_goto(true, "ERROR"), desc = "Next Error" },
	{ "[w", diagnostic_goto(false, "WARN"), desc = "Previous Warn" },
	{ "]w", diagnostic_goto(true, "WARN"), desc = "Next Warn" },
	{ "[h", diagnostic_goto(false, "HINT"), desc = "Previous Hint" },
	{ "]h", diagnostic_goto(true, "HINT"), desc = "Next Hint" },
	{ "[i", diagnostic_goto(false, "INFO"), desc = "Previous Info" },
	{ "]i", diagnostic_goto(true, "INFO"), desc = "Next Info" },
	{ "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature Help" },
	{ "<leader>lI", toggle_inlay_hints, desc = "Toggle inlayHints" },
	{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
	{ "<leader>lA", vim.lsp.codelens.run, desc = "CodeLens Action" },
	{ "<leader>lq", "<cmd>Telescope loclist<CR>", desc = "Quickfix" },
	{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
	{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Workspace Symbols" },
	{ "<leader>lw", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
	{ "<leader>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>", desc = "Buffer Diagnostics" },
	{ "<leader>lW", "<cmd>Telescope lsp_workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
	{
		"<leader>ld",
		'<cmd>lua require("telescope.builtin").lsp_type_definitions({ reuse_win = true })<CR>',
		desc = "Type Definition",
	},
	{
		"<leader>ll",
		"<cmd>lua vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		desc = "List Workspace Folders",
	},

	{ "<leader>dt", '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = "Toggle Breakpoint" },
	{ "<leader>db", '<cmd>lua require("dap").step_back()<CR>', desc = "Step Back" },
	{ "<leader>dc", '<cmd>lua require("dap").continue()<CR>', desc = "Continue" },
	{ "<leader>dC", '<cmd>lua require("dap").run_to_cursor()<CR>', desc = "Run to Cursor" },
	{ "<leader>dd", '<cmd>lua require("dap").disconnect()<CR>', desc = "Disconnect" },
	{ "<leader>dg", '<cmd>lua require("dap").session()<CR>', desc = "Get Session" },
	{ "<leader>di", '<cmd>lua require("dap").step_into()<CR>', desc = "Step Into" },
	{ "<leader>do", '<cmd>lua require("dap").step_over()<CR>', desc = "Step Over" },
	{ "<leader>du", '<cmd>lua require("dap").step_out()<CR>', desc = "Step Out" },
	{ "<leader>dp", '<cmd>lua require("dap").pause()<CR>', desc = "Pause" },
	{ "<leader>dr", '<cmd>lua require("dap").repl.toggle()<CR>', desc = "Toggle REPL" },
	{ "<leader>dq", '<cmd>lua require("dap").close()<CR>', desc = "Quit" },
	{ "<leader>dU", '<cmd>lua require("dapui").toggle({reset = true})<CR>', desc = "Dap UI" },
	{ "<leader>de", '<cmd>lua require("dap").goto_()<CR>', desc = "Go to line (no execute)" },
	{ "<leader>dv", '<cmd>lua require("dapui").eval()<CR>', desc = "Eval" },
	{ "<leader>dw", '<cmd>lua require("dap.ui.widgets").hover()<CR>', desc = "Widgets" },
	{ "<leader>dl", '<cmd>lua require("dap").run_last()<CR>', desc = "Run Last" },
	{ "<leader>dT", '<cmd>lua require("dap").terminate()<CR>', desc = "Terminate" },
	{ "<leader>dj", '<cmd>lua require("dap").down()<CR>', desc = "Down" },
	{ "<leader>dk", '<cmd>lua require("dap").up()<CR>', desc = "Up" },
	{
		"<leader>dB",
		"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
		desc = "Breakpoint Condition",
	},
}

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
						if vim.g.colors_name ~= light_theme then
							set_light_theme()
						end
					end,
				})

				vim.api.nvim_create_autocmd("User", {
					pattern = "LumenDark",
					callback = function()
						if vim.g.colors_name ~= dark_theme then
							set_dark_theme()
						end
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
			event = { "InsertEnter" },
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
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
						local snip_keys = {
							{
								"<C-J>",
								-- stylua: ignore
								function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end,
								mode = { "i", "s" },
								desc = "Snip expand or jump",
							},
							{
								"<C-K>",
								-- stylua: ignore
								function() if ls.jumpable(-1) then ls.jump(-1) end end,
								mode = { "i", "s" },
								desc = "Snip jump backwards",
							},
							{
								"<C-L>",
								-- stylua: ignore
								function() if ls.choice_active() then ls.change_choice(1) end end,
								mode = { "i", "s" },
								desc = "Snip choice",
							},
						}
						set_keys(snip_keys)

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
					"zbirenbaum/copilot.lua",
					cmd = "Copilot",
					build = ":Copilot auth",
					dependencies = { "zbirenbaum/copilot-cmp", opts = {} },
					opts = {
						panel = { enabled = false },
						suggestion = { enabled = false },
						filetypes = {
							yaml = true,
							markdown = true,
							help = true,
						},
					},
				},
				{
					"Exafunction/codeium.nvim",
					config = function()
						require("codeium").setup({
							config_path = vim.fn.stdpath("config") .. "/codeium/config.json",
						})
					end,
				},
			},
			config = function()
				local cmp = require("cmp")
				local ls = require("luasnip")
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
					Copilot = "",
					Codeium = "󰚩",
				}

				local item_menu = {
					nvim_lsp = "LSP",
					copilot = "Copilot",
					codeium = "Codeium",
					luasnip = "Snip",
					buffer = "Buffer",
					path = "Path",
					emoji = "Emoji",
				}

				local cmp_default_sources = {
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "copilot" },
					{ name = "codeium" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}

				local function has_words_before()
					unpack = unpack or table.unpack
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and not vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
				end

				local function cmp_mapping()
					return cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-U>"] = cmp.mapping.scroll_docs(-3),
						["<C-D>"] = cmp.mapping.scroll_docs(3),
						["<C-C>"] = function(fallback)
							cmp.abort()
							fallback()
						end,
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<S-CR>"] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								return cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
							elseif ls.expandable() then
								return ls.expand()
							elseif has_words_before() then
								return cmp.complete()
							end
							fallback()
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								return cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
							end
							fallback()
						end, { "i", "s" }),
					})
				end

				local function cmp_format_with_tailwind(entry, vim_item)
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
					vim_item.menu = (item_menu)[entry.source.name]
					return vim_item
				end

				cmp.setup({
					snippet = {
						-- stylua: ignore
						expand = function(args) ls.lsp_expand(args.body) end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},
					mapping = cmp_mapping(),
					formatting = {
						fields = { "kind", "abbr", "menu" },
						format = cmp_format_with_tailwind,
					},
					sources = cmp_default_sources,
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
					lazy = true,
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
					}) or vim.bo.commentstring
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
				local function hide_section()
					local width = vim.fn.winwidth(0)
					local buffers = -1

					for _, v in ipairs(vim.api.nvim_list_bufs()) do
						if vim.api.nvim_buf_is_loaded(v) then
							buffers = buffers + 1
						end
					end

					local cond1 = width < 100
					local cond2 = buffers > 7
					local cond3 = buffers > 4 and width < 150

					return not (cond1 or cond2 or cond3)
				end

				local filename = {
					"filename",
					path = 1,
					symbols = { modified = "●", readonly = "", unnamed = "" },
					cond = function()
						local buf = vim.api.nvim_get_current_buf()
						return vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
					end,
				}

				local navic = {
					-- stylua: ignore
					function() return require("nvim-navic").get_location() end,
					cond = function()
						return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
					end,
					draw_empty = true,
				}

				local mode = {
					"mode",
					fmt = function(str)
						if hide_section() then
							return str
						end
						return str:sub(1, 1)
					end,
				}

				local diagnostics = {
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "hint", "info" },
					symbols = { error = " ", warn = " ", hint = " ", info = " " },
					always_visible = false,
				}

				local buffers = {
					"buffers",
					icons_enabled = false,
					icon = { align = "left" },
					symbols = { alternate_file = "" },
				}

				local diff = {
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
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
				}

				local dap_status = {
					function()
						return "  " .. require("dap").status()
					end,
					cond = function()
						return package.loaded["dap"] and require("dap").status() ~= ""
					end,
				}

				local lazy_status = { require("lazy.status").updates, cond = require("lazy.status").has_updates }

				require("lualine").setup({
					options = { globalstatus = true, section_separators = "", component_separators = "" },
					winbar = { lualine_c = { filename, navic } },
					sections = {
						lualine_a = { mode },
						lualine_b = { "branch" },
						lualine_c = { diagnostics, "%=", buffers },
						lualine_x = { diff, "filetype", dap_status, lazy_status },
						lualine_y = { "location" },
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
					"lazy",
					"mason",
				},
				under_cursor = false,
			},
			config = function(_, opts)
				require("illuminate").configure(opts)

				local function rhs(dir)
					return function()
						require("illuminate")["goto_" .. dir .. "_reference"](false)
					end
				end
				local function illumOpts(dir, buffer)
					return { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer or nil }
				end

				local function kmap(lhs, dir, buffer)
					vim.keymap.set("n", lhs, rhs(dir), illumOpts(dir, buffer))
				end

				-- set it after loading ftplugins, since a lot overwrite [[ and ]]
				vim.api.nvim_create_autocmd("FileType", {
					callback = function(event)
						kmap("]]", "next", event.buf)
						kmap("[[", "prev", event.buf)
					end,
				})

				vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })
			end,
		},

		{
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufReadPost", "BufNewFile" },
			main = "ibl",
			opts = {
				enabled = false,
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
				mappings = {
					goto_top = "[I",
					goto_bottom = "]I",
				},
			},
			init = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
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
					local gs = package.loaded.gitsigns
					local git_keys = {
						{
							"<leader>gj",
							"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>",
							desc = "Next hunk",
						},
						{
							"<leader>gk",
							"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>",
							desc = "Prev hunk",
						},
						{
							"<leader>gl",
							-- stylua: ignore
							function() gs.blame_line({ full = true }) end,
							desc = "Blame",
						},
						{ "<leader>gL", gs.toggle_current_line_blame, desc = "Toggle blame" },
						{ "<leader>gp", gs.preview_hunk, desc = "Preview hunk" },
						{ "<leader>gr", gs.reset_hunk, desc = "Reset hunk" },
						{ "<leader>gR", gs.reset_buffer, desc = "Reset buffer" },
						{ "<leader>gS", gs.stage_buffer, desc = "Stage buffer" },
						{ "<leader>gs", gs.stage_hunk, desc = "Stage hunk" },
						{ "<leader>gu", gs.undo_stage_hunk, desc = "Undo stage hunk" },
						{ "<leader>gd", gs.diffthis, desc = "Diff" },
						{
							"<leader>gD",
							-- stylua: ignore
							function() gs.diffthis("origin") end,
							desc = "Diff origin",
						},
						{ "<leader>gt", gs.toggle_deleted, desc = "Toggle Deleted" },
						{ "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Open changed file" },
						{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Checkout branch" },
						{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Checkout commit" },
						{
							"<leader>gC",
							"<cmd>Telescope git_bcommits<CR>",
							desc = "Checkout commit(for current file)",
						},
						{ "<leader>gh", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Select hunk" },
						{
							"<leader>gs",
							-- stylua: ignore
							function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
							mode = { "o", "x" },
							desc = "Stage Hunk",
						},
						{
							"<leader>gr",
							-- stylua: ignore
							function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
							mode = { "o", "x" },
							desc = "Reset Hunk",
						},
					}

					for _, v in ipairs(git_keys) do
						v.buffer = bufnr
					end
					set_keys(git_keys)
				end,
			},
		},

		{
			"echasnovski/mini.surround",
			opts = {
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",
				},
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
							"prettier",
							"stylua",
						}

						local installed_packages = require("mason-registry").get_installed_package_names()
						for _, v in ipairs(packages) do
							if not vim.tbl_contains(installed_packages, v) then
								vim.cmd("MasonInstall " .. v)
							end
						end

						-- tailwindcss triggers completion on spaces which send the maximum number of completion items;
						-- removing space from triggerCharacters can significantly improves performance
						-- https://github.com/hrsh7th/nvim-cmp/issues/1828
						vim.api.nvim_create_autocmd("LspAttach", {
							callback = function()
								for _, client in pairs((lsp_get_clients())) do
									if client.name == "tailwindcss" then
										client.server_capabilities.completionProvider.triggerCharacters =
											{ '"', "'", "`", ".", "(", "[", "!", "/", ":" }
									end
								end
							end,
						})
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
					{ name = "DiagnosticSignHint", text = "" },
					{ name = "DiagnosticSignInfo", text = "" },
				}

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

					if vim.lsp.codelens and client.supports_method("textDocument/codeLens") then
						vim.lsp.codelens.refresh()
						vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
							buffer = bufnr,
							callback = vim.lsp.codelens.refresh,
						})
					end

					local buf = vim.api.nvim_get_current_buf()
					local ft = vim.bo[buf].filetype
					if ft:find("typescript") then
						-- stylua: ignore
						local lsp_ts_keys = {
							{ "<leader>lo", function() vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports.ts" }, diagnostics = {} }, }) end, desc = "Organize Imports" },
							{ "<leader>lR", function() vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} }, }) end, desc = "Remove Unused Imports" },
						}
						set_keys(lsp_ts_keys)
					end

					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
					for _, v in ipairs(lsp_keys) do
						v.buffer = bufnr
					end
					set_keys(lsp_keys)
				end

				for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
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
							goto lsp_setup
						end

						local node_path = util.find_node_modules_ancestor(vim.fn.expand("%:p:h"))
						if node_path and util.path.exists(node_path .. "/node_modules/eslint") then
							goto lsp_setup
						end

						local git_path = util.find_git_ancestor(vim.fn.expand("%:p:h"))
						if git_path and util.path.exists(git_path .. "/node_modules/eslint") then
							goto lsp_setup
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
								hint = { enable = true },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
							},
						}
					end

					if server == "tsserver" then
						opts.settings = {
							javascript = {
								inlayHints = {
									includeInlayEnumMemberValueHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayVariableTypeHints = true,
								},
							},
							typescript = {
								inlayHints = {
									includeInlayEnumMemberValueHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayVariableTypeHints = true,
								},
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

					::lsp_setup::
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
			"nvim-neo-tree/neo-tree.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
			cmd = "Neotree",
			keys = {
				{
					"<leader>e",
					function()
						require("neo-tree.command").execute({
							toggle = true,
							dir = find_root(nil, nil, function(path)
								return vim.fs.dirname(path)
							end),
						})
					end,
					desc = "Explorer NeoTree",
				},
				{
					"<leader>E",
					function()
						require("neo-tree.command").execute({
							toggle = true,
							dir = vim.uv.cwd(),
						})
					end,
					desc = "Explorer NeoTree (CWD)",
				},
				{
					"<leader>be",
					function()
						require("neo-tree.command").execute({ source = "buffers", toggle = true })
					end,
					desc = "Buffer Explorer",
				},
				{
					"<leader>ge",
					function()
						require("neo-tree.command").execute({ source = "git_status", toggle = true })
					end,
					desc = "Git Explorer",
				},
			},
			deactivate = function()
				vim.cmd([[Neotree close]])
			end,
			init = function()
				vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1
				if vim.fn.argc(-1) == 1 then
					local stat = vim.uv.fs_stat(vim.fn.argv(0))
					if stat and stat.type == "directory" then
						require("neo-tree")
					end
				end
			end,
			opts = {
				sources = { "filesystem", "buffers", "git_status", "document_symbols" },
				open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
				filesystem = {
					bind_to_cwd = false,
					follow_current_file = { enabled = true },
					use_libuv_file_watcher = true,
					hijack_netrw_behavior = "open_current",
				},
				default_component_configs = {
					indent = {
						with_expanders = true,
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					modified = {
						symbol = "●",
					},
				},
				window = {
					mappings = {
						["<space>"] = "none",
						["Y"] = {
							function(state)
								local node = state.tree:get_node()
								local path = node:get_id()
								vim.fn.setreg("+", path, "c")
							end,
							desc = "Copy Path to Clipboard",
						},
						["O"] = {
							function(state)
								require("lazy.util").open(state.tree:get_node().path, { system = true })
							end,
							desc = "Open with System Application",
						},
						["e"] = function()
							vim.cmd("Neotree focus filesystem left")
						end,
						["b"] = function()
							vim.cmd("Neotree focus buffers left")
						end,
						["g"] = function()
							vim.cmd("Neotree focus git_status left")
						end,
					},
				},
			},
			config = function(_, opts)
				local function on_open()
					require("neo-tree.command").execute({ action = "close" })
				end
				local function on_change(data)
					lsp_on_rename(data.source, data.destination)
				end

				local events = require("neo-tree.events")
				opts.event_handlers = opts.event_handlers or {}
				vim.list_extend(opts.event_handlers, {
					{ event = events.FILE_OPENED, handler = on_open },
					{ event = events.FILE_MOVED, handler = on_change },
					{ event = events.FILE_RENAMED, handler = on_change },
				})
				require("neo-tree").setup(opts)
				vim.api.nvim_create_autocmd("TermClose", {
					pattern = "*lazygit",
					callback = function()
						if package.loaded["neo-tree.sources.git_status"] then
							require("neo-tree.sources.git_status").refresh()
						end
					end,
				})
			end,
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
			"rcarriga/nvim-notify",
			init = function()
				vim.notify = require("notify")
			end,
			opts = {},
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
						buffers = {
							mappings = {
								n = {
									["<S-d>"] = "delete_buffer",
								},
							},
						},
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
			event = "VeryLazy",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {},
			-- stylua: ignore
			keys = {
				{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
				{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
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
					ensure_installed = "",
					sync_install = false,
					auto_install = true,
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
				map("n", "zR", require("ufo").openAllFolds)
				map("n", "zM", require("ufo").closeAllFolds)
			end,
			opts = {},
		},

		{
			"Wansmer/treesj",
			keys = {
				{
					"<leader>lm",
					function()
						require("treesj").toggle()
					end,
					desc = "Split or Join code block with autodetect",
				},
			},
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			opts = {
				use_default_keymaps = false,
			},
		},

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			config = function()
				require("which-key").register({
					["<leader>"] = {
						b = { name = "Buffers" },
						d = { name = "Debug" },
						f = { name = "Find" },
						l = { name = "LSP" },
						g = { name = "Git" },
						r = { name = "Session" },
						x = { name = "Plugins", l = { name = "Lazy" } },
					},
					g = { name = "Goto", s = { name = "Surround" } },
				})
				require("which-key").register({
					["<leader>"] = {
						l = { name = "LSP" },
					},
					g = { name = "Goto", s = { name = "Surround" } },
				}, { mode = "v" })
			end,
		},
	})
end

set_keys(keys)
