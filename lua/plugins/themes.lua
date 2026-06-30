return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        palettes = {
          github_dark_dimmed = {
            canvas = {
              default = "#282c34",
              overlay = "#2d333b",
              inset   = "#1c2128",
              subtle  = "#2d333b",
            },

            scale = {
              gray = {
                "#cdd9e5", "#adbac7", "#909dab", "#768390",
                "#636e7b", "#545d68", "#444c56", "#373e47",
                "#2d333b", "#282c34",
              },
              white = "#cdd9e5",
              black = "#1c2128",
              blue = {
                "#dcccf0", "#c8b8e0", "#b39cd0", "#a088c0",
                "#8a6fb0", "#7058a0", "#584088", "#403070",
                "#302058", "#201040",
              },
              green = {
                "#a8e8e0", "#8dd8d0", "#7ec8c0", "#5cb8b0",
                "#4aa098", "#388880", "#267068", "#1c5850",
                "#124038", "#082820",
              },
              yellow = {
                "#eee8b0", "#ddd491", "#d4c87a", "#c4b860",
                "#b0a450", "#9c9040", "#887830", "#746820",
                "#605810", "#4c4800",
              },
              orange = {
                "#f5cba0", "#e8b080", "#d99560", "#cc6b2c",
                "#b05a20", "#944818", "#783810", "#602808",
                "#481800", "#301000",
              },
              red = {
                "#f0b0b0", "#e08585", "#d47373", "#c06060",
                "#a85050", "#944040", "#803030", "#6c2020",
                "#581010", "#440000",
              },
              purple = {
                "#dcccf0", "#c8b0e8", "#b39cd0", "#a088c0",
                "#8a6fb0", "#7058a0", "#584088", "#403070",
                "#302058", "#201040",
              },
              pink = {
                "#f0c0d8", "#e0a8c0", "#d090b0", "#c96198",
                "#ae4c82", "#983868", "#802850", "#6c1840",
                "#580830", "#440020",
              },
              coral = {
                "#f0c0b8", "#e0a098", "#d08078", "#c06058",
                "#a85048", "#944038", "#803028", "#6c2018",
                "#581008", "#440000",
              },
            },

            orange  = "#cc6b2c",
            black   = { base = "#282c34", bright = "#2d333b" },
            gray    = { base = "#636e7b", bright = "#768390" },
            blue    = { base = "#b39cd0", bright = "#c8b8e0" },
            green   = { base = "#7ec8c0", bright = "#8dd8d0" },
            magenta = { base = "#a088c0", bright = "#b39cd0" },
            pink    = { base = "#c96198", bright = "#d47aa8" },
            red     = { base = "#d47373", bright = "#e08585" },
            white   = { base = "#cdd9e5", bright = "#e0e4e8" },
            yellow  = { base = "#d4c87a", bright = "#ddd491" },
            cyan    = { base = "#76e3ea", bright = "#b3f0ff" },

            fg = {
              default     = "#cdd9e5",
              muted       = "#8b949e",
              subtle      = "#636e7b",
              on_emphasis = "#cdd9e5",
            },

            border = {
              default = "#444c56",
              muted   = "#373e47",
              subtle  = "#3c4048",
            },

            neutral = {
              emphasis_plus = "#545d68",
              emphasis      = "#545d68",
              muted  = "#444a53",
              subtle = "#2f333c",
            },

            accent = {
              fg       = "#b39cd0",
              emphasis = "#a088c0",
              muted    = "#605972",
              subtle   = "#3d3d4b",
            },

            success = {
              fg       = "#7ec8c0",
              emphasis = "#4aa098",
              muted    = "#4a6a6c",
              subtle   = "#354349",
            },

            attention = {
              fg       = "#d4c87a",
              emphasis = "#b0a450",
              muted    = "#6d6a50",
              subtle   = "#42433f",
            },

            severe = {
              fg       = "#cc6b2c",
              emphasis = "#a85a20",
              muted    = "#6a4531",
              subtle   = "#413533",
            },

            danger = {
              fg       = "#d47373",
              emphasis = "#a85050",
              muted    = "#6d484d",
              subtle   = "#42373d",
            },

            open = {
              fg       = "#7ec8c0",
              emphasis = "#4aa098",
              muted    = "#4a6a6c",
              subtle   = "#354349",
            },

            done = {
              fg       = "#a088c0",
              emphasis = "#8a6fb0",
              muted    = "#58516c",
              subtle   = "#3a3a49",
            },

            closed = {
              fg       = "#d47373",
              emphasis = "#a85050",
              muted    = "#6d484d",
              subtle   = "#42373d",
            },

            sponsors = {
              fg       = "#c96198",
              emphasis = "#ae4c82",
              muted    = "#68415c",
              subtle   = "#403443",
            },
          },
        },

        specs = {
          github_dark_dimmed = {
            syntax = {
              bracket     = "fg1",
              builtin0    = "#a088c0",
              builtin1    = "#d47373",
              builtin2    = "#d4c87a",
              comment     = "#636e7b",
              conditional = "#d47373",
              const       = "#d4c87a",
              dep         = "#c06060",
              field       = "#cdd9e5",
              func        = "#a088c0",
              ident       = "fg1",
              keyword     = "#d47373",
              number      = "#d4c87a",
              operator    = "#d4c87a",
              param       = "fg1",
              preproc     = "#d47373",
              regex       = "#76e3ea",
              statement   = "#d47373",
              string      = "#b39cd0",
              type        = "#7ec8c0",
              tag         = "#7ec8c0",
              variable    = "fg1",
            },
          },
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup()
    end
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup()
    end
  },
  {
    "notken12/base46-colors",
    lazy = false,
    priority = 1000,
  }
}
