local M = {}

M.load_mappings = function()
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts = { mode = mode }
        for keybind, mapping_info in pairs(mode_values) do
          local opts = vim.tbl_deep_extend('force', default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require('core.config').mappings

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

return M
