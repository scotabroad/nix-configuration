-- You can define your global state here
-- Make many of these be tables indexed by tag
tag_nmaster = { }
tag_ratio = { }
tag_ratio_alt = { }
tag_ratio_ideal = { }
tag_delta = { } --this is unused
tag_gaps = { }
tag_gaps_alt = { }
tag_windows = { }
tag_layouts = { }

-- The most important function - the actual layout generator
--
-- The argument is a table with:
--  * Focused tags (`args.tags`)
--  * Window count (`args.count`)
--  * Output width (`args.width`)
--  * Output height (`args.height`)
--  * Output name (`args.output`)
--
-- The return value must be a table with exactly `count` entries. Each entry is a table with four
-- numbers:
--  * X coordinate of top corner
--  * Y coordinate of top corner
--  * Window width
--  * Window height
--

-- Want to mimic my old Xmonad config,
-- myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol ||| Mirror threeCol
-- where
--   threeCol = ThreeColMid nmaster delta ratio <-- Master is in the middle
--   tiled    = Tall nmaster delta ratio <-- Master is to the left
--   nmaster  = 1      -- Default number of windows in the master pane
--   ratio    = 1/2    -- Default proportion of screen occupied by master pane
--   delta    = 3/100  -- Percent of screen to increment by when resizing panes
function handle_layout(args)
	tag_windows[args.tags] = args.count  --Does not seem to be made available like tags or outputs
	if tag_layouts[args.tags] == nil then
		tag_nmaster[args.tags] = 1
		tag_ratio[args.tags] = 0.5
		tag_ratio_alt[args.tags] = 0
		tag_ratio_ideal[args.tags] = false
		tag_delta[args.tags] = 0.03 --this is unused
		tag_gaps[args.tags] = 10
		tag_gaps_alt[args.tags] = 0
		tag_layouts[args.tags] = "Tall"
	end
	if tag_nmaster[args.tags] > args.count then
		--clamping only operates if inc_master(num) is called
		tag_nmaster[args.tags] = args.count
	end
	return layouts[tag_layouts[args.tags]](args)
end

-- A simple layout with vertical splits
function vertical_layout(args)
	local retval = {}
	local gaps = tag_gaps[args.tags]
	local side_w = (args.width - gaps * (1 + args.count)) / (args.count)
	local side_h = args.height - gaps * 2
	for i = 0, (args.count - 1) do
		table.insert(retval, {
			gaps + i * (side_w + gaps),
			gaps,
			side_w,
			side_h,
		})
	end
	return retval
end

-- A simple layout with horizontal splits
function horizontal_layout(args)
	local retval = {}
	local gaps = tag_gaps[args.tags]
	local side_w = args.width - gaps * 2
	local side_h = (args.height - gaps * (1 + args.count)) / (args.count)
	for i = 0, (args.count - 1) do
		table.insert(retval, {
			gaps,
			gaps + i * (side_h + gaps),
			side_w,
			side_h,
		})
	end
	return retval
end

-- This mimics Xmonad's Tall.
function tall_layout(args)
	local retval = {}
	local nmaster = tag_nmaster[args.tags]
	local ratio = tag_ratio[args.tags]
	local ratio_ideal = tag_ratio_ideal[args.tags]
	local gaps = tag_gaps[args.tags]
	if args.count <= nmaster then
		retval = vertical_layout(args)
	elseif args.count > nmaster then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 0.5
		        end
			local side_w = (args.width - gaps * 3) * (1 - ratio) -- this should be fixed to a "constant" length
			local main_w = ((args.width - gaps * (2 + nmaster)) - side_w) / (nmaster)
			local side_h = (args.height - gaps) / (args.count - nmaster) - gaps
			local main_h = args.height - gaps * 2
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					gaps + i * (main_w + gaps),
					gaps,
					main_w,
					main_h,
				})
			end
			for i = 0, (args.count - (1 + nmaster)) do
				table.insert(retval, {
					gaps + (main_w + gaps) * nmaster,
					gaps + i * (side_h + gaps),
					side_w,
					side_h,
				})
			end
		else
			retval = horizontal_layout(args)
		end
	end
	return retval
end

-- This mimics Xmonad's Mirror Tall.
function mirror_tall_layout(args)
	local retval = {}
	local nmaster = tag_nmaster[args.tags]
	local ratio = tag_ratio[args.tags]
	local ratio_ideal = tag_ratio_ideal[args.tags]
	local gaps = tag_gaps[args.tags]
	if args.count <= nmaster then
		retval = horizontal_layout(args)
	elseif args.count > nmaster then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 0.5
			end
			local side_h = (args.height - gaps * 3) * (1 - ratio)
			local main_h = ((args.height - gaps * (2 + nmaster)) - side_h) / (nmaster)
			local main_w = args.width - gaps * 2
			local side_w = (args.width - gaps) / (args.count - nmaster) - gaps
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					gaps,
					gaps + i * (main_h + gaps),
					main_w,
					main_h,
				})
			end
			for i = 0, (args.count - (1 + nmaster)) do
				table.insert(retval, {
					gaps + i * (side_w + gaps),
					gaps + (main_h + gaps) * nmaster,
					side_w,
					side_h,
				})
			end
		else
			retval = vertical_layout(args)
		end
	end
	return retval
end

-- One window per tag, stack all others
function full_layout(args)
	local retval = {}
	local gaps = tag_gaps[args.tags]
	local side_w = args.width - gaps * 2
	local side_h = args.height - gaps * 2
	for i = 0, (args.count - 1) do
		table.insert(retval, {
			gaps,
			gaps,
			side_w,
			side_h,
		})
	end
	return retval
end

-- ThreeColMid
function three_col_layout(args)
	local retval = {}
	local nmaster = tag_nmaster[args.tags]
	local ratio = tag_ratio[args.tags]
	local ratio_ideal = tag_ratio_ideal[args.tags]
	local gaps = tag_gaps[args.tags]
	if args.count < nmaster + 1 then
		retval = horizontal_layout(args)
	elseif args.count == nmaster + 1 then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 0.5
			end
			local main_w = (args.width - gaps * 3) * ratio
			local main_h = (args.height - gaps * (1 + nmaster)) / (nmaster)
			local side_w = (args.width - gaps * 3) * (1 - ratio)
			local side_h = (args.height - gaps * 2)
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					gaps,
					gaps + i * (main_h + gaps),
					main_w,
					main_h,
				})
			end
			table.insert(retval, {
				main_w + gaps * 2,
				gaps,
				side_w,
				side_h,
			})
		else
			local side_w = args.width - gaps * 2
			local side_h = args.height - gaps * 2
			for i = 0, (args.count - 1) do
				table.insert(retval, {
					gaps,
					gaps,
					side_w,
					side_h,
				})
			end
		end
	elseif args.count > nmaster + 1 then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 1/3
			end
			local main_w = (args.width - gaps * 4) * ratio
			local main_h = (args.height - gaps * (1 + nmaster)) / (nmaster)
			local side_w = ((args.width - gaps * 4) * (1 - ratio)) / 2
			local left = math.ceil((args.count - nmaster) / 2)
			local right = math.floor((args.count - nmaster) / 2)
			local left_h = (args.height - gaps) / (left) - gaps
			local right_h = (args.height - gaps) / (right) - gaps
			--main
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					side_w + gaps * 2,
					gaps + i * (main_h + gaps),
					main_w,
					main_h,
				})
			end
			--left
			for i=0, (left - 1) do
				table.insert(retval, {
					gaps,
					gaps + i * (left_h + gaps),
					side_w,
					left_h,
				})
			end
			--right
			for i=0, (right - 1) do
				table.insert(retval, {
					side_w + main_w + gaps*3,
					gaps + i * (right_h + gaps),
					side_w,
					right_h,
				})
			end
		else
			local side_w = ((args.width - gaps * 3)) / 2
			local left = math.ceil((args.count) / 2)
			local right = math.floor((args.count) / 2)
			local left_h = (args.height - gaps) / (left) - gaps
			local right_h = (args.height - gaps) / (right) - gaps
			--left
			for i=0, (left - 1) do
				table.insert(retval, {
					gaps,
					gaps + i * (left_h + gaps),
					side_w,
					left_h,
				})
			end
			--right
			for i=0, (right - 1) do
				table.insert(retval, {
					side_w + gaps*2,
					gaps + i * (right_h + gaps),
					side_w,
					right_h,
				})
			end
		end
	end
	return retval
end

-- ThreeColMid Mirror
function mirror_three_col_layout(args)
	local retval = {}
	local nmaster = tag_nmaster[args.tags]
	local ratio = tag_ratio[args.tags]
	local ratio_ideal = tag_ratio_ideal[args.tags]
	local gaps = tag_gaps[args.tags]
	if args.count < nmaster + 1 then
		retval = vertical_layout(args)
	elseif args.count == nmaster + 1 then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 0.5
			end
			local main_h = (args.height - gaps * 3) * ratio
			local main_w = (args.width - gaps * (1 + nmaster)) / (nmaster)
			local side_h = (args.height - gaps * 3) * (1 - ratio)
			local side_w = (args.width - gaps * 2)
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					gaps + i * (main_w + gaps),
					gaps,
					main_w,
					main_h,
				})
			end
			table.insert(retval, {
				gaps,
				main_h + gaps * 2,
				side_w,
				side_h,
			})
		else
			local side_w = args.width - gaps * 2
			local side_h = args.height - gaps * 2
			for i = 0, (args.count - 1) do
				table.insert(retval, {
					gaps,
					gaps,
					side_w,
					side_h,
				})
			end
		end
	elseif args.count > nmaster + 1 then
		if nmaster > 0 then
			if ratio_ideal then
				ratio = 1/3
			end
			local main_h = (args.height - gaps * 4) * ratio
			local main_w = (args.width - gaps * (1 + nmaster)) / (nmaster)
			local side_h = ((args.height - gaps * 4) * (1 - ratio)) / 2
			local top = math.ceil((args.count - nmaster) / 2)
			local bottom = math.floor((args.count - nmaster) / 2)
			local top_w = (args.width - gaps) / (top) - gaps
			local bottom_w = (args.width - gaps) / (bottom) - gaps
			--main
			for i = 0, (nmaster - 1) do
				table.insert(retval, {
					gaps + i * (main_w + gaps),
					side_h + gaps * 2,
					main_w,
					main_h,
				})
			end
			--top
			for i=0, (top - 1) do
				table.insert(retval, {
					gaps + i * (top_w + gaps),
					gaps,
					top_w,
					side_h,
				})
			end
			--bottom
			for i=0, (bottom - 1) do
				table.insert(retval, {
					gaps + i * (bottom_w + gaps),
					side_h + main_h + gaps*3,
					bottom_w,
					side_h,
				})
			end
		else
			local side_h = ((args.height - gaps * 3)) / 2
			local top = math.ceil((args.count) / 2)
			local bottom = math.floor((args.count) / 2)
			local top_w = (args.width - gaps) / (top) - gaps
			local bottom_w = (args.width - gaps) / (bottom) - gaps
			--top
			for i=0, (top - 1) do
				table.insert(retval, {
					gaps + i * (top_w + gaps),
					gaps,
					top_w,
					side_h,
				})
			end
			--bottom
			for i=0, (bottom - 1) do
				table.insert(retval, {
					gaps + i * (bottom_w + gaps),
					side_h + gaps*2,
					bottom_w,
					side_h,
				})
			end
		end
	end
	return retval
end

-- This optional function returns the metadata for the current layout.
-- Currently only `name` is supported, the name of the layout. It get's passed
-- the same `args` as handle_layout()
function handle_metadata(args)
	return {name = tag_layouts[args.tags] }
end

-- IMPORTANT: User commands send via `riverctl send-layout-cmd` are treated as lua code.
-- Active tags are stored in `CMD_TAGS` global variable.
-- Output name is stored in `CMD_OUTPUT` global variable.
function toggle_layout(num)
	current_layout = tag_layouts[CMD_TAGS]
	local layout = 0
	for i = 0, 4 do
		if layout_nums[i] == current_layout then
			layout = i
		end
	end
	layout = (layout + num) % 5
	tag_layouts[CMD_TAGS] = layout_nums[layout]
end

-- Here is an example of a function that can be mapped to some key
-- Run with `riverctl send-layout-cmd luatile "toggle_gaps()"`
-- All below function will make sure a change on one tag does not affect another
function toggle_gaps()
	local tmp = tag_gaps[CMD_TAGS]
	tag_gaps[CMD_TAGS] = tag_gaps_alt[CMD_TAGS]
	tag_gaps_alt[CMD_TAGS] = tmp
end

function toggle_ratio()
	if tag_ratio_ideal[CMD_TAGS] == false then
		tag_ratio_ideal[CMD_TAGS] = true
	else
		tag_ratio_ideal[CMD_TAGS] = false
	end
end

function inc_nmaster(num)
	local nmaster = tag_nmaster[CMD_TAGS]
	local windows = tag_windows[CMD_TAGS]
	tag_nmaster[CMD_TAGS] = clamp(0, nmaster + num, windows)
end

function inc_ratio(num)
	-- Do not manipulate variable if using ideal ratio
	if tag_ratio_ideal[CMD_TAGS] == false then
		local ratio = tag_ratio[CMD_TAGS]
		tag_ratio[CMD_TAGS] = clamp(0.05, ratio + num, 0.95)
	end
end

function clamp(min, val, max)
	if val < min then
		return min
	elseif val > max then
		return max
	end
	return val
end

-- these tables must come at the end of function declarations for some reason
layouts = {
	["Tall"] = tall_layout,
	["Mirror Tall"] = mirror_tall_layout,
	["Full"] = full_layout,
	["ThreeColMid"] = three_col_layout,
	["Mirror ThreeColMid"] = mirror_three_col_layout,
}

layout_nums = {
	[0] = "Tall",
	[1] = "Mirror Tall",
	[2] = "Full",
	[3] = "ThreeColMid",
	[4] = "Mirror ThreeColMid",
}
