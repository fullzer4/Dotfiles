local function set_options()
  if vim.bo.modifiable == false or vim.bo.buftype ~= "" then
    vim.defer_fn(safe_set_options, 10)
    return
  end

  local opt = vim.opt

  pcall(function() opt.updatetime = 100 end)
  pcall(function() opt.timeoutlen = 300 end)
  pcall(function() opt.redrawtime = 1500 end)
  pcall(function() opt.lazyredraw = true end)

  pcall(function() opt.number = true end)
  pcall(function() opt.relativenumber = true end)
  pcall(function() opt.termguicolors = true end)
  pcall(function() opt.signcolumn = "yes" end)
  pcall(function() opt.wrap = false end)
  pcall(function() opt.scrolloff = 8 end)
  pcall(function() opt.sidescrolloff = 8 end)
  pcall(function() opt.cursorline = true end)
  pcall(function() opt.mouse = "a" end)

  pcall(function() opt.expandtab = true end)
  pcall(function() opt.shiftwidth = 2 end)
  pcall(function() opt.tabstop = 2 end)
  pcall(function() opt.smartindent = true end)
  pcall(function() opt.ignorecase = true end)
  pcall(function() opt.smartcase = true end)
  pcall(function() opt.hlsearch = false end)
  pcall(function() opt.incsearch = true end)

  pcall(function() opt.clipboard = "unnamedplus" end)
  pcall(function() opt.fileencoding = "utf-8" end)
  pcall(function() opt.swapfile = false end)
  pcall(function() opt.backup = false end)
  pcall(function() opt.undofile = true end)

  local undodir = os.getenv("HOME") .. "/.vim/undodir"
  if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
  end
  pcall(function() opt.undodir = undodir end)

  pcall(function() opt.splitbelow = true end)
  pcall(function() opt.splitright = true end)

  pcall(function() opt.completeopt = { "menuone", "noselect", "noinsert", "popup" } end)
  pcall(function() opt.pumheight = 10 end)

  pcall(function() opt.hidden = true end)
  pcall(function() opt.history = 100 end)
  pcall(function() opt.synmaxcol = 240 end)
end

set_options()
