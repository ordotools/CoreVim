require('tabby.tabline').use_preset('active_wins_at_tail', {
	-- Other Presets:
	-- active_tab_with_wins, tab_with_top_win, active_wins_at_end, 
	-- active_wins_at_tail, tab_only
  theme = {
    fill = 'TabLineFill',       -- tabline background
    head = 'TabLine',           -- head element highlight
    current_tab = 'TabLineSel', -- current tab label highlight
    tab = 'TabLine',		    -- other tab label highlight
    win = 'TabLine',			-- window highlight
    tail = 'TabLine',           -- tail element highlight
  },
  tab_name = {
      name_fallback = 'function({tabid}), return a string',
  },
  buf_name = {
      mode = "'unique'|'relative'|'tail'|'shorten'",
  },
})
