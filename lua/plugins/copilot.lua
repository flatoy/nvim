return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true, -- Make sure this is explicitly enabled
      auto_trigger = true, -- Enable auto triggering
      hide_during_completion = false, -- Don't hide during blink completion
      debounce = 75, -- Debounce time in ms
      keymap = {
        accept = false, -- handled by completion engine
        accept_word = false,
        accept_line = false,
        next = false,
        prev = false,
        dismiss = false,
      },
    },
    panel = {
      enabled = true,
    },
    filetypes = {
      ["*"] = true, -- Enable for all filetypes by default
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
              return false -- Important: return false if no suggestion
            end,
          },
        },
      },
    },
  },
}
