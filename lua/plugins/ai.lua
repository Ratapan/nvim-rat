return {
  -- ollama integration
  {
    "jpmcb/nvim-llama",
    config = function()
      require("nvim-llama").setup({
        -- See plugin debugging logs
        debug = false,
        -- The model for ollama to use. This model will be automatically downloaded.
        model = llama2,
      })
    end,
  },
}
