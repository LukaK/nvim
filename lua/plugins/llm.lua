-- Large language model support
-- chatgpt usage details: https://platform.openai.com/usage
-- chatgpt settings: https://platform.openai.com/settings/organization/billing/payment-methods
--
return {
  {
    "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("chatgpt").setup({
          openai_params = {
            model = "gpt-4o",
          }
        })
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
        "nvim-telescope/telescope.nvim"
      }
  }
}
