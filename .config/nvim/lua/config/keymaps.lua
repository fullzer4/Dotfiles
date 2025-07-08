local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("v", "<C-c>", '"+y', opts)
keymap({"n", "v"}, "<C-v>", '"+p', opts)
keymap("i", "<C-v>", '<C-r>+', opts)
keymap("n", "<C-a>", "ggVG", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

keymap("n", "<leader>gg", ":LazyGit<CR>", opts)
keymap("n", "<leader>gj", ":lua require('gitsigns').next_hunk()<CR>", opts)
keymap("n", "<leader>gk", ":lua require('gitsigns').prev_hunk()<CR>", opts)
keymap("n", "<leader>gp", ":lua require('gitsigns').preview_hunk()<CR>", opts)

keymap("n", "gl", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico na linha" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Próximo diagnóstico" })

keymap("n", "gd", vim.lsp.buf.definition, { desc = "Ir para definição" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Ver referências" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Mostrar documentação" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renomear símbolo" })
