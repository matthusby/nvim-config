if vim.g.neovide then
    vim.o.guifont = "Source Code Pro:h16"
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_input_use_logo = 1
    vim.api.nvim_set_keymap('', '<D-v>', "+p<CR>", { noremap = true, silent = true})
    vim.api.nvim_set_keymap('!', '<D-v>', "<C-R>+", { noremap = true, silent = true})
    vim.api.nvim_set_keymap('t', '<D-v>', "<C-R>+", { noremap = true, silent = true})
    vim.api.nvim_set_keymap('v', '<D-v>', "<C-R>+", { noremap = true, silent = true})
end

