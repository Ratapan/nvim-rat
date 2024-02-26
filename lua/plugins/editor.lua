return {
  -- Hihglight colors
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {},
  },
  -- #ffffff
  -- #ccfcfc
  -- #fccfff

  --#My Telescope config
  --##Funcionalidades Principales
  --- Búsqueda de Archivos (;f): Permite buscar archivos en tu directorio de trabajo actual, respetando las reglas de .gitignore, pero mostrando archivos ocultos. Esto es útil para encontrar rápidamente archivos específicos sin salir de Neovim.
  --- Búsqueda en Vivo (;r): Realiza una búsqueda en vivo (live grep) para encontrar ocurrencias de texto en tiempo real dentro de tu proyecto, lo cual es excelente para encontrar referencias a variables, funciones, o simplemente cualquier cadena de texto en tus archivos.
  --- Listado de Buffers (\\): Muestra una lista de todos los buffers abiertos (archivos que tienes abiertos en Neovim), facilitando el cambio rápido entre ellos.
  --- Reanudar Búsqueda (;;): Te permite reanudar la última búsqueda realizada con Telescope, útil si necesitas volver a los resultados previos.
  --- Diagnostics (;e): Lista los diagnósticos (errores, advertencias, etc.) para todos los buffers abiertos o un buffer específico, ayudándote a identificar y corregir problemas en tu código.
  --- Treesitter (;s): Muestra nombres de funciones, variables, y otros símbolos en tu código actual, utilizando Treesitter para un análisis semántico preciso.
  --- Navegador de Archivos (sf): Abre un navegador de archivos en la ubicación del buffer actual, permitiéndote explorar y gestionar archivos y directorios dentro de Neovim.

  {
    "telescope.nvim",
    priority = 1000,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
