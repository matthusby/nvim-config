local bufferline = require('bufferline')

bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        separator_style = "thick",
        style_preset = bufferline.style_preset.slant, -- or bufferline.style_preset.minimal,
        numbers = "none",
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- | 'underline' | 'none',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
              local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- NOTE: this will be called a lot so don't do any heavy processing here
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            -- for an element e.g. a buffer or a tab.
            -- e.g.
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
            -- or
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        --enforce_regular_tabs = false | true,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_at_end'
    }
}
