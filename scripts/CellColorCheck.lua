-- CellColorCheck v1.5.0 - 2019-07-12, by Vent/Extend
-- ** Run this script on a blank layer **
-- This project began by modifying Paulo Silva's script 

-- History
-- v1.5.0 2019-07-12:
-- * added support for picture-specific configuration files
-- * lots of refactoring
-- v1.4.0 2017-04-19:
-- * some minor refactoring
-- * added search for optimal bgcolor
-- v1.3.2 2016-09-07: 
-- * fixed mcol with borders
-- v1.3 2016-08-08: 
-- * added support for mcol pic with borders
-- * added support for 80x50 petscii
--
-- TODO / Wishlist
-- * wait keypress for menu / subfunctions
-- * preview mode with several palettes
-- * export to c64 formats such as Koala, DrazLace, executable .prg etc.
-- * export sprites to png and data
-- * color rule check for sprites
-- * sorting of different bgcolors / showing more than one option;
--   helping to find the optimum choice, which is not always the obvious one
-- * all MMI strings to MMI_STRINGS

MMI_STRINGS = {
    title = "CCCv1.5.0 Define pixel cell"
}  -- man-machine interface strings

SUPPORTED_GFX_FORMATS = {}
SUPPORTED_GFX_FORMATS['mcol'] = {
    name = "C64 Multicolor",
    w = 160, h = 200,
    cell_width = 4, cell_height = 8, cell_colors = 4, common_bg_color = true,
    x0 = 0, y0 = 0
}
SUPPORTED_GFX_FORMATS['mcol_borders'] = {
    name = "C64 Multicolor with borders",
    w = 384 / 2, h = 272,
    cell_width = 4, cell_height = 8, cell_colors = 4, common_bg_color = true,
    x0 = 16, y0 = 34
}
SUPPORTED_GFX_FORMATS['hires'] = {
    name = "C64 Hires",
    w = 320, h = 200,
    cell_width = 8, cell_height = 8, cell_colors = 2, common_bg_color = false,
    x0 = 0, y0 = 0
}
SUPPORTED_GFX_FORMATS['hires_borders'] = {  -- C64 hires with borders
    name = "C64 Hires with borders",
    w = 384, h = 272,
    cell_width = 8, cell_height = 8, cell_colors = 2, common_bg_color = false,
    x0 = 16, y0 = 34
}
SUPPORTED_GFX_FORMATS['petscii_quarters'] = {
    name = "C64 Petscii quarter blocks",
    w = 80, h = 50,
    cell_width = 2, cell_height = 2, cell_colors = 2, common_bg_color = true,
}
SUPPORTED_GFX_FORMATS['msx_screen2'] = {
    name = "MSX Screen 2",
    w = 256, h = 192,
    cell_width = 8, cell_height = 1, cell_colors = 2, common_bg_color = true,
    x0 = 0, y0 = 0
}

function draw_rectangle(xa, ya, xb, yb, c)
    -- draw a non-filled rectangle
    putpicturepixel(xa, ya, c)
    drawline(xa, ya, xa, yb, c)
    drawline(xb, ya, xb, yb, c)
    drawline(xa, ya, xb, ya, c)
    drawline(xa, yb, xb, yb, c)
end

function get_cell_histogram(cell_x, cell_y, config)
    -- returns the histogram of colors in a cell.

    local histogram = {}
    if tonumber(config.usebgcolor) == 1 then
        histogram[tonumber(config.bgcolor)] = 0
    end

    for y = 0, config.ycell - 1, 1 do
        -- for each pixel row in a cell
        for x = 0, config.xcell - 1, 1 do
            -- for each pixel in a row
            local i = getpicturepixel(cell_x + x, cell_y + y)
            if histogram[i] == nil then
                histogram[i] = 1
            else
                histogram[i] = histogram[i] + 1
            end
        end
    end
    return histogram
end

function table_len(t)
    -- returns the number of elements in table

    local len = 0
    for _ in pairs(t) do
        len = len + 1
    end
    return len
end

function analyze_picture(bgcol, config, indicate_bad_cells)
    local bad_cells = 0
    local vacant_cells = 0
    for y1 = config.y0, config.y0 + config.h - 1, config.ycell do
        -- for each row of cells
        for x1 = config.x0, config.x0 + config.w - 1, config.xcell do
            -- for each cell in a row
            local cell_colors = get_cell_histogram(x1, y1, config)
            if table_len(cell_colors) > tonumber(config.colors) then

                if config.common_bg_color == true and config.cell_colors == 2 then
                    rectcolor = 1
                else
                    rectcolor = table_len(cell_colors)
                end
                if indicate_bad_cells == true then
                    -- if background color not -1
                    draw_rectangle(x1, y1, (x1 + config.xcell - 1), (y1 + config.ycell - 1), rectcolor) --mark it with a rectangle
                end
                bad_cells = bad_cells + 1 --cell count
                -- statusmessage(badcells.." bad cells found")
            elseif dispvacant == 1 then
                --vacant cells, where more colours could be added
                if #cell_colors < config.colors then
                    if cellindicator then
                        draw_rectangle(x1, y1, (x1 + config.xcell - 1), (y1 + config.ycell - 1), (#cell_colors)) --mark it with a rectangle
                    end
                    vacant_cells = vacant_cells + 1 --cell count
                    -- statusmessage(vacantcells .. " not full cells found")
                end
            end
        end
    end
    return bad_cells, vacant_cells
end

function display_report(bad_cells, vacant_cells)
    local report
    if bad_cells > 0 then
        report = "Found " .. bad_cells .. " cells with too many colors."
    else
        report = "No bad cells found!"
    end
    if vacant_cells > 0 then
        report = report .. "\nFound " .. vacant_cells .. " cells which could hold up more colors."
    end
    report = report .. "\nCell size: " .. config.xcell .. "x" .. config.ycell .. "px."
    messagebox(report)
end

function write_config_to_file(filename, data)
    -- Write table of textual values to configuration file as key=value lines

    local f = assert(io.open(filename, "w"))

    -- serialize key/val pairs
    for k, v in pairs(data) do
        if (type(v) ~= "string") then
            v = tostring(v)
        end
        f:write(k .. "=" .. v .. "\n")
    end
    f:close()
end

function load_config_from_file(filename)
    -- Read key=value lines from a configuration file to a table
    -- omits lines not matching the 'key=value' pattern

    local data = {}
    -- local f = assert(io.open(filename, "r"))
    for line in (io.lines(filename)) do
        for key, val in string.gmatch(line, "(%w+)=(%w+)") do
            data[key] = val
        end
    end
    -- f:close()
    return data
end

function get_config_from_user()

    local w, h = getpicturesize()
    local config = {  -- default unless overwritten below
        w = w, h = h,
        x0 = 0, y0 = 0,
    }
    local guessformat = {}
    guessformat = SUPPORTED_GFX_FORMATS.mcol  -- default: multicolor
    for gfxformat, val in pairs(SUPPORTED_GFX_FORMATS) do
        if val['w'] == w then
            guessformat = val
        end
    end

    bgcolor = getbackcolor()

    local ok = false
    statusmessage(guessformat['name'])
    ok, config.xcell, config.ycell, config.colors, config.usebgcolor, config.bgcolor, config.dispvacant, config.savecfg = inputbox(MMI_STRINGS['title'],
    -- title, defaultvalue, min, max, step
            "Cell width", guessformat.cell_width, 2, 8, 1,
            "Cell height", guessformat.cell_height, 1, 8, 1,
            "Colors in a cell", guessformat.cell_colors, 1, 16, 1,
            "Use a common bgcolor", bool_to_number(guessformat.common_bg_color), 0, 1, 0,
            "Common background color", bgcolor, -1, 15, 1,
            "Show vacant cells", 0, 0, 1, 0,
            "Save configuration", 0, 0, 1, 0
    );

    if ok ~= true then
        return false
    end

    return config
end

function is_file_readable(fname)
    local f = io.open(fname, 'r')
    if f == nil then
        return false
    else
        f.close()
        return true
    end
end

function bool_to_number(bool)
    -- casts boolean to integer. If true, return 1. Otherwise return 0
    if bool == true then
        return 1
    else
        return 0
    end
end

function main()

    local config = {}

    local picname, picpath = getfilename()
    local sep = package.config:sub(1, 1)  -- directory separator
    local fname = picpath .. sep .. picname .. '_config.ini'

    if not is_file_readable(fname) then
        -- ask user if file has no config
        config = get_config_from_user()
        if config == false then
            -- exit if no config approved by user
            return false
        end
    else
        config = load_config_from_file(fname)
    end

    if config.bgcolor == -1 then
        local indicate_bad_cells = false -- do not draw rectangles
        -- find optimum bgcolor:
        local best_bg_candidate = 0  -- best bgcolor
        local best_bg_bad_cells = 999999  -- high enough value

        for bg_color_candidate = 0, 15, 1 do
            local bad_cells, vacant_cells = analyze_picture(bg_color_candidate, config, indicate_bad_cells)

            statusmessage(bad_cells .. " bad cells found")

            if bad_cells < best_bg_bad_cells then
                best_bg_candidate = bg_color_candidate
                best_bg_bad_cells = bad_cells
            end
        end
        messagebox("Best found background color: " .. best_bg_candidate .. " with " .. best_bg_bad_cells .. " bad cells found")
        config.bgcolor = best_bg_candidate
    else
        -- ordinary check cells
        local indicate_bad_cells = true
        local bad_cells, vacant_cells = analyze_picture(config.bgcolor, config, indicate_bad_cells)
        statusmessage(bad_cells .. " bad cells found")
        wait(0.25)

    end
    if config.savecfg == 1 then
        config.savecfg = nil
        write_config_to_file(fname, config)
    end

end

------------------------------------------------------------------------------------------------------------------------
main()