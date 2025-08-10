return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    auto_save_enabled = true,
    auto_restore_enabled = false,
    -- log_level = 'debug',
  },
  keys = {
    { '<leader><F1>', '<cmd>SessionSearch<cr>', desc = 'Browse sessions' },
    { '<leader><F2>', '<cmd>SessionSave<cr>', desc = 'Save session' },
    { '<leader><F3>', '<cmd>SessionToggleAutoSave<cr>', desc = 'Toggle auto save session' },
  },
}