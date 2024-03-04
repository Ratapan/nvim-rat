return {
  {
    -- Tener NotoColorEmoji.ttf
    -- Instalar silicon $ sudo pacman -S silicon
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "JetBrainsMono-Regular=34;NotoColorEmoji=34",
        theme = "gruvbox-dark",
        background = "#FFF7EB",
        background_image = nil,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end,
        output = function()
          return "~/Pictures/Code/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
        end,
      })
    end,
  },
}
