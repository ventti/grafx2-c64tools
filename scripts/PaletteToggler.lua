-- PaletteToggler v1.0.0 - 2019-07-12, by Vent/Extend
-- Toggles between different C64 palettes
-- Usage: Press F1 for online help.

-- History
-- v1.0.0 2019-07-12: Initial version


DEFAULT_PALETTE = 'Pepto'

KEYMAP = {}  -- fixme
KEYMAP[48] = 0
KEYMAP[49] = 1
KEYMAP[50] = 2
KEYMAP[51] = 3
KEYMAP[52] = 4
KEYMAP[53] = 5
KEYMAP[54] = 6
KEYMAP[55] = 7
KEYMAP[56] = 8
KEYMAP[57] = 9
KEYMAP[97] = "a"
KEYMAP[98] = "b"
KEYMAP[99] = "c"
KEYMAP[100] = "d"
KEYMAP[101] = "e"
KEYMAP[102] = "f"
KEYMAP[103] = "g"
KEYMAP[104] = "h"
KEYMAP[105] = "i"
KEYMAP[106] = "j"
KEYMAP[107] = "k"
KEYMAP[108] = "l"
KEYMAP[109] = "m"
KEYMAP[110] = "n"
KEYMAP[111] = "o"
KEYMAP[112] = "p"
KEYMAP[113] = "q"
KEYMAP[114] = "r"
KEYMAP[115] = "s"
KEYMAP[116] = "t"
KEYMAP[117] = "u"
KEYMAP[118] = "v"
KEYMAP[119] = "w"
KEYMAP[120] = "x"
KEYMAP[121] = "y"
KEYMAP[122] = "z"

PALETTE = {}
PALETTE[1] = {
    name = "Pepto",
    platform = "C64",
    colors = { -- index, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0x68, 0x37, 0x2B },
        { 3, 0x70, 0xA4, 0xB2 },
        { 4, 0x6F, 0x3D, 0x86 },
        { 5, 0x58, 0x8D, 0x43 },
        { 6, 0x35, 0x28, 0x79 },
        { 7, 0xB8, 0xC7, 0x6F },
        { 8, 0x6F, 0x4F, 0x25 },
        { 9, 0x43, 0x39, 0x00 },
        { 10, 0x9A, 0x67, 0x59 },
        { 11, 0x44, 0x44, 0x44 },
        { 12, 0x6C, 0x6C, 0x6C },
        { 13, 0x9A, 0xD2, 0x84 },
        { 14, 0x6C, 0x5E, 0xB5 },
        { 15, 0x95, 0x95, 0x95 },
    }
}
PALETTE[2] = {
    name = "Ptoing",
    platform = "C64",
    colors = { -- index, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xFF, 0xFF, 0xFF },
        { 2, 0x8C, 0x3E, 0x34 },
        { 3, 0x7A, 0xBF, 0xC7 },
        { 4, 0x8D, 0x47, 0xB3 },
        { 5, 0x68, 0xA9, 0x41 },
        { 6, 0x3E, 0x31, 0xA2 },
        { 7, 0xD0, 0xDC, 0x71 },
        { 8, 0x90, 0x5F, 0x25 },
        { 9, 0x57, 0x42, 0x00 },
        { 10, 0xBB, 0x77, 0x6D },
        { 11, 0x54, 0x54, 0x54 },
        { 12, 0x80, 0x80, 0x80 },
        { 13, 0xAC, 0xEA, 0x88 },
        { 14, 0x7C, 0x70, 0xDA },
        { 15, 0xAB, 0xAB, 0xAB }
    }
}
PALETTE[3] = {
    name = "c64hq",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x0a, 0x0a, 0x0a },
        { 1, 0xff, 0xf8, 0xff },
        { 2, 0x85, 0x1f, 0x02 },
        { 3, 0x65, 0xcd, 0xa8 },
        { 4, 0xa7, 0x3b, 0x9f },
        { 5, 0x4d, 0xab, 0x19 },
        { 6, 0x1a, 0x0c, 0x92 },
        { 7, 0xeb, 0xe3, 0x53 },
        { 8, 0xa9, 0x4b, 0x02 },
        { 9, 0x44, 0x1e, 0x00 },
        { 10, 0xd2, 0x80, 0x74 },
        { 11, 0x46, 0x46, 0x46 },
        { 12, 0x8b, 0x8b, 0x8b },
        { 13, 0x8e, 0xf6, 0x8e },
        { 14, 0x4d, 0x91, 0xd1 },
        { 15, 0xba, 0xba, 0xba }
    }
}
PALETTE[4] = {
    name = "c64s",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xfc, 0xfc, 0xfc },
        { 2, 0xa8, 0x00, 0x00 },
        { 3, 0x54, 0xfc, 0xfc },
        { 4, 0xa8, 0x00, 0xa8 },
        { 5, 0x00, 0xa8, 0x00 },
        { 6, 0x00, 0x00, 0xa8 },
        { 7, 0xfc, 0xfc, 0x00 },
        { 8, 0xa8, 0x54, 0x00 },
        { 9, 0x80, 0x2c, 0x00 },
        { 10, 0xfc, 0x54, 0x54 },
        { 11, 0x54, 0x54, 0x54 },
        { 12, 0x80, 0x80, 0x80 },
        { 13, 0x54, 0xfc, 0x54 },
        { 14, 0x54, 0x54, 0xfc },
        { 15, 0xa8, 0xa8, 0xa8 }
    }
}
PALETTE[5] = {
    name = "ccs64",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x10, 0x10, 0x10 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0xe0, 0x40, 0x40 },
        { 3, 0x60, 0xff, 0xff },
        { 4, 0xe0, 0x60, 0xe0 },
        { 5, 0x40, 0xe0, 0x40 },
        { 6, 0x40, 0x40, 0xe0 },
        { 7, 0xff, 0xff, 0x40 },
        { 8, 0xe0, 0xa0, 0x40 },
        { 9, 0x9c, 0x74, 0x48 },
        { 10, 0xff, 0xa0, 0xa0 },
        { 11, 0x54, 0x54, 0x54 },
        { 12, 0x88, 0x88, 0x88 },
        { 13, 0xa0, 0xff, 0xa0 },
        { 14, 0xa0, 0xa0, 0xff },
        { 15, 0xc0, 0xc0, 0xc0 }
    }
}
PALETTE[6] = {
    name = "community",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0xaf, 0x2a, 0x29 },
        { 3, 0x62, 0xd8, 0xcc },
        { 4, 0xb0, 0x3f, 0xb6 },
        { 5, 0x4a, 0xc6, 0x4a },
        { 6, 0x37, 0x39, 0xc4 },
        { 7, 0xe4, 0xed, 0x4e },
        { 8, 0xb6, 0x59, 0x1c },
        { 9, 0x68, 0x38, 0x08 },
        { 10, 0xea, 0x74, 0x6c },
        { 11, 0x4d, 0x4d, 0x4d },
        { 12, 0x84, 0x84, 0x84 },
        { 13, 0xa6, 0xfa, 0x9e },
        { 14, 0x70, 0x7c, 0xe6 },
        { 15, 0xb6, 0xb6, 0xb5 }
    }
}
PALETTE[7] = {
    name = "deekay",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0x88, 0x20, 0x00 },
        { 3, 0x68, 0xd0, 0xa8 },
        { 4, 0xa8, 0x38, 0xa0 },
        { 5, 0x50, 0xb8, 0x18 },
        { 6, 0x18, 0x10, 0x90 },
        { 7, 0xf0, 0xe8, 0x58 },
        { 8, 0xa0, 0x48, 0x00 },
        { 9, 0x47, 0x2b, 0x1b },
        { 10, 0xc8, 0x78, 0x70 },
        { 11, 0x48, 0x48, 0x48 },
        { 12, 0x80, 0x80, 0x80 },
        { 13, 0x98, 0xff, 0x98 },
        { 14, 0x50, 0x90, 0xd0 },
        { 15, 0xb8, 0xb8, 0xb8 }
    }
}
PALETTE[8] = {
    name = "frodo",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0xcc, 0x00, 0x00 },
        { 3, 0x00, 0xff, 0xcc },
        { 4, 0xff, 0x00, 0xff },
        { 5, 0x00, 0xcc, 0x00 },
        { 6, 0x00, 0x00, 0xcc },
        { 7, 0xff, 0xff, 0x00 },
        { 8, 0xff, 0x88, 0x00 },
        { 9, 0x88, 0x44, 0x00 },
        { 10, 0xff, 0x88, 0x88 },
        { 11, 0x44, 0x44, 0x44 },
        { 12, 0x88, 0x88, 0x88 },
        { 13, 0x88, 0xff, 0x88 },
        { 14, 0x88, 0x88, 0xff },
        { 15, 0xcc, 0xcc, 0xcc }
    }
}
PALETTE[9] = {
    name = "godot",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0x88, 0x00, 0x00 },
        { 3, 0xaa, 0xff, 0xee },
        { 4, 0xcc, 0x44, 0xcc },
        { 5, 0x00, 0xcc, 0x55 },
        { 6, 0x00, 0x00, 0xaa },
        { 7, 0xee, 0xee, 0x77 },
        { 8, 0xdd, 0x88, 0x55 },
        { 9, 0x66, 0x44, 0x00 },
        { 10, 0xfe, 0x77, 0x77 },
        { 11, 0x33, 0x33, 0x33 },
        { 12, 0x77, 0x77, 0x77 },
        { 13, 0xaa, 0xff, 0x66 },
        { 14, 0x00, 0x88, 0xff },
        { 15, 0xbb, 0xbb, 0xbb }
    }
}
PALETTE["a"] = {
    name = "pc64",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x21, 0x21, 0x21 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0xb5, 0x21, 0x21 },
        { 3, 0x73, 0xff, 0xff },
        { 4, 0xb5, 0x21, 0xb5 },
        { 5, 0x21, 0xb5, 0x21 },
        { 6, 0x21, 0x21, 0xb5 },
        { 7, 0xff, 0xff, 0x21 },
        { 8, 0xb5, 0x73, 0x21 },
        { 9, 0x94, 0x42, 0x21 },
        { 10, 0xff, 0x73, 0x73 },
        { 11, 0x73, 0x73, 0x73 },
        { 12, 0x94, 0x94, 0x94 },
        { 13, 0x73, 0xff, 0x73 },
        { 14, 0x73, 0x73, 0xff },
        { 15, 0xb5, 0xb5, 0xb5 }
    }
}
PALETTE["b"] = {
    name = "vice",
    platform = "C64",
    colors = {  -- idx, r, g, b
        { 0, 0x00, 0x00, 0x00 },
        { 1, 0xff, 0xff, 0xff },
        { 2, 0x68, 0x37, 0x2b },
        { 3, 0x70, 0xa4, 0xb2 },
        { 4, 0x6f, 0x3d, 0x86 },
        { 5, 0x58, 0x8d, 0x43 },
        { 6, 0x35, 0x28, 0x79 },
        { 7, 0xb8, 0xc7, 0x6f },
        { 8, 0x6f, 0x4f, 0x25 },
        { 9, 0x43, 0x39, 0x00 },
        { 10, 0x9a, 0x67, 0x59 },
        { 11, 0x44, 0x44, 0x44 },
        { 12, 0x6c, 0x6c, 0x6c },
        { 13, 0x9a, 0xd2, 0x84 },
        { 14, 0x6c, 0x5e, 0xb5 },
        { 15, 0x95, 0x95, 0x95 }
    }
}
PALETTE["c"] = {
    name = "colorode",
    platform = "C64",
    colors = {
        { 0, 0, 0, 0 },
        { 1, 254, 254, 254 },
        { 2, 129, 51, 55 },
        { 3, 117, 206, 200 },
        { 4, 141, 59, 151 },
        { 5, 85, 172, 77 },
        { 6, 45, 43, 154 },
        { 7, 237, 240, 113 },
        { 8, 141, 80, 41 },
        { 9, 84, 55, 0 },
        { 10, 196, 108, 113 },
        { 11, 73, 73, 73 },
        { 12, 123, 123, 123 },
        { 13, 169, 254, 159 },
        { 14, 111, 109, 235 },
        { 15, 177, 177, 177 }
    }
}
PALETTE["d"] = {
    name = "electric",
    platform = "C64",
    colors = {
        { 0, 0, 0, 0 },
        { 1, 255, 255, 255 },
        { 2, 139, 31, 0 },
        { 3, 111, 223, 183 },
        { 4, 167, 59, 159 },
        { 5, 74, 181, 16 },
        { 6, 8, 0, 148 },
        { 7, 243, 235, 91 },
        { 8, 165, 66, 0 },
        { 9, 99, 41, 24 },
        { 10, 203, 123, 111 },
        { 11, 69, 68, 68 },
        { 12, 159, 159, 159 },
        { 13, 148, 255, 148 },
        { 14, 74, 148, 214 },
        { 15, 189, 189, 189 }
    }
}

PALETTE["e"] = {
    name = "vent",
    platform = "C64",
    colors = {
        { 0, 13, 13, 13 },
        { 1, 255, 255, 255 },
        { 2, 125, 61, 46 },
        { 3, 108, 187, 207 },
        { 4, 127, 60, 159 },
        { 5, 97, 167, 66 },
        { 6, 58, 44, 141 },
        { 7, 206, 223, 112 },
        { 8, 131, 92, 42 },
        { 9, 79, 68, 13 },
        { 10, 184, 104, 83 },
        { 11, 81, 81, 81 },
        { 12, 121, 121, 121 },
        { 13, 162, 232, 135 },
        { 14, 107, 90, 209 },
        { 15, 162, 162, 162 }
    }
}
function show_help_message_box()
    text = "Browse: [SPACE], LMB. Exit:[ESC], RMB\n"
    local newline = false
    for key, palette in pairs(PALETTE) do
        text = text .. "[" .. tostring(key) .. "]: " .. palette.name
        if newline == true then
            text = text .. "\n"
        else
            text = text .. ", "
        end
        newline = not (newline)
    end
    messagebox("Palette Toggler v1.0.0", text)
end

function set_palette(palette)
    for _, color in pairs(palette.colors) do
        local idx, r, g, b = color[1], color[2], color[3], color[4]
        setcolor(idx, r, g, b)
    end
end

function load_vpl(file)
    -- todo
end

function toggler()
    local exit_script = false
    local moved, key, mx, my, mb, px, py
    local text = "F1 for help"
    statusmessage(text)
    repeat  -- kludgy repeated for loop needed due to lack of a decent table iterator
        for name, palette in pairs(PALETTE) do
            moved, key, mx, my, mb, px, py = waitinput(99999)  -- wait until user interaction
            -- messagebox(key)  -- debug
            if mb == 2 or key == 27 then
                -- mouse or esc quits
                exit_script = true
                break
            elseif key == 32 or mb == 1 then
                -- space or LMB to browse palettes
                set_palette(palette)
                text = palette.name
            elseif PALETTE[KEYMAP[key]] ~= nil then
                set_palette(PALETTE[KEYMAP[key]])
                text = PALETTE[KEYMAP[key]].name
            elseif key == 282 then
                show_help_message_box()
            end
            updatescreen()
            statusmessage(text)
            wait(0.25)
        end
    until exit_script == true
end

--
toggler()