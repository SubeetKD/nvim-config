require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitSignsAddNr'},
    change       = {hl = 'GitGutterChange', text = '│', numhl='GitSignsChangeNr'},
    delette       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr'},
    changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr'},
  }
}
