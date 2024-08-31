vim.g.mapleader = " "    --Defines the leader key as space
vim.keymap.set('n', '<C-n>', ':Neotree toggle filesystem left<CR>')
vim.keymap.set('n', '<Leader><t>', ':botright 18sp term://bash')
vim.api.nvim_set_keymap('t', '<Leader><ESC>', '<C-\\><C-n>', {noremap = true})
