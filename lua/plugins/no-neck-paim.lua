return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    width = 200,                 -- centered editing column
    buffers = { left = { enabled = true }, right = { enabled = true } },
    autocmds = { enableOnVimEnter = true },
    integrations = { NeoTree = { position = "centered" } },
    mappings = { enabled = false },
  },
}
