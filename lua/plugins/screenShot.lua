return {
  {
    "mistricky/codesnap.nvim",
    lazy = "true",
    build = "make",
    cmd = "CodeSnapPreviewOn",
    opts = {
      mac_window_bar = false,
      opacity = true,
      watermark = "Ratapan",
      watermark_font_family = "Nimbus Mono",
    },
    config = function(_, opts)
      require("codesnap").setup(opts)
    end,
  },
}
