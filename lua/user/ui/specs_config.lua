require('specs').setup{
	show_jumps  = true,
	min_jump = 05,
	popup = {
		delay_ms = 0, -- delay before popup displays
		inc_ms = 75, -- time increments used for fade/resize effects 
		blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
		width = 10,
		winhl = "PMenu",
		fader = require('specs').exp_fader,
		resizer = require('specs').shrink_resizer
	},
	ignore_filetypes = {},
	ignore_buftypes = {
		nofile = true,
	},
}
--require('specs').setup{
    --popup = {
	---- Simple constant blend effect
        --fader = function(blend, cnt)
            --if cnt > 100 then
                --return 80
            --else return nil end
        --end,
	---- Growing effect from left to right
        --resizer = function(width, ccol, cnt)
            --if width-cnt > 0 then
                --return {width+cnt, ccol}
            --else return nil end
        --end,
    --}
--}
