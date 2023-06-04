local custom_codedark = require'lualine.themes.codedark'

custom_codedark["command"] = {
    ["a"] = {
      ["bg"] = "#b8bb26",
      ["fg"] = "#282828",
      ["gui"] = "bold"
    },
    ["b"] = {
      ["bg"] = "#504945",
      ["fg"] = "#ebdbb2"
    },
    ["c"] = {
      ["bg"] = "#7c6f64",
      ["fg"] = "#282828"
    }
  }


-- print(vim.inspect(custom_codedark))
-- Change the background of lualine_a section for command mode
custom_codedark.normal.a.bg = '#8e911d'
custom_codedark.insert.a.bg = '#a3a622'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_codedark,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path=3
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'fugitive'}
}
