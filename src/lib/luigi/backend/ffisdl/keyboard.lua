local REL = (...):gsub('[^.]*$', '')

local sdl = require(REL .. 'sdl')

local Keyboard = {
    scancodeByString = {},
    stringByScancode = {},
    keycodeByString = {},
    stringByKeycode = {},
}

local function registerScancodes (registry)
    for _, entry in ipairs(registry) do
        Keyboard.scancodeByString[entry[1]] = entry[2]
        Keyboard.stringByScancode[entry[2]] = entry[1]
    end
end

local function registerKeycodes (registry)
    for _, entry in ipairs(registry) do
        Keyboard.keycodeByString[entry[1]] = entry[2]
        Keyboard.stringByKeycode[entry[2]] = entry[1]
    end
end

registerScancodes {
    { "unknown", sdl.SCANCODE_UNKNOWN },
    { "a", sdl.SCANCODE_A },
    { "b", sdl.SCANCODE_B },
    { "c", sdl.SCANCODE_C },
    { "d", sdl.SCANCODE_D },
    { "e", sdl.SCANCODE_E },
    { "f", sdl.SCANCODE_F },
    { "g", sdl.SCANCODE_G },
    { "h", sdl.SCANCODE_H },
    { "i", sdl.SCANCODE_I },
    { "j", sdl.SCANCODE_J },
    { "k", sdl.SCANCODE_K },
    { "l", sdl.SCANCODE_L },
    { "m", sdl.SCANCODE_M },
    { "n", sdl.SCANCODE_N },
    { "o", sdl.SCANCODE_O },
    { "p", sdl.SCANCODE_P },
    { "q", sdl.SCANCODE_Q },
    { "r", sdl.SCANCODE_R },
    { "s", sdl.SCANCODE_S },
    { "t", sdl.SCANCODE_T },
    { "u", sdl.SCANCODE_U },
    { "v", sdl.SCANCODE_V },
    { "w", sdl.SCANCODE_W },
    { "x", sdl.SCANCODE_X },
    { "y", sdl.SCANCODE_Y },
    { "z", sdl.SCANCODE_Z },

    { "1", sdl.SCANCODE_1 },
    { "2", sdl.SCANCODE_2 },
    { "3", sdl.SCANCODE_3 },
    { "4", sdl.SCANCODE_4 },
    { "5", sdl.SCANCODE_5 },
    { "6", sdl.SCANCODE_6 },
    { "7", sdl.SCANCODE_7 },
    { "8", sdl.SCANCODE_8 },
    { "9", sdl.SCANCODE_9 },
    { "0", sdl.SCANCODE_0 },

    { "return", sdl.SCANCODE_RETURN },
    { "escape", sdl.SCANCODE_ESCAPE },
    { "backspace", sdl.SCANCODE_BACKSPACE },
    { "tab", sdl.SCANCODE_TAB },
    { "space", sdl.SCANCODE_SPACE },

    { "-", sdl.SCANCODE_MINUS },
    { "=", sdl.SCANCODE_EQUALS },
    { "[", sdl.SCANCODE_LEFTBRACKET },
    { "]", sdl.SCANCODE_RIGHTBRACKET },
    { "\\", sdl.SCANCODE_BACKSLASH },
    { "nonus#", sdl.SCANCODE_NONUSHASH },
    { ";", sdl.SCANCODE_SEMICOLON },
    { "'", sdl.SCANCODE_APOSTROPHE },
    { "`", sdl.SCANCODE_GRAVE },
    { ",", sdl.SCANCODE_COMMA },
    { ".", sdl.SCANCODE_PERIOD },
    { "/", sdl.SCANCODE_SLASH },

    { "capslock", sdl.SCANCODE_CAPSLOCK },

    { "f1", sdl.SCANCODE_F1 },
    { "f2", sdl.SCANCODE_F2 },
    { "f3", sdl.SCANCODE_F3 },
    { "f4", sdl.SCANCODE_F4 },
    { "f5", sdl.SCANCODE_F5 },
    { "f6", sdl.SCANCODE_F6 },
    { "f7", sdl.SCANCODE_F7 },
    { "f8", sdl.SCANCODE_F8 },
    { "f9", sdl.SCANCODE_F9 },
    { "f10", sdl.SCANCODE_F10 },
    { "f11", sdl.SCANCODE_F11 },
    { "f12", sdl.SCANCODE_F12 },

    { "printscreen", sdl.SCANCODE_PRINTSCREEN },
    { "scrolllock", sdl.SCANCODE_SCROLLLOCK },
    { "pause", sdl.SCANCODE_PAUSE },
    { "insert", sdl.SCANCODE_INSERT },
    { "home", sdl.SCANCODE_HOME },
    { "pageup", sdl.SCANCODE_PAGEUP },
    { "delete", sdl.SCANCODE_DELETE },
    { "end", sdl.SCANCODE_END },
    { "pagedown", sdl.SCANCODE_PAGEDOWN },
    { "right", sdl.SCANCODE_RIGHT },
    { "left", sdl.SCANCODE_LEFT },
    { "down", sdl.SCANCODE_DOWN },
    { "up", sdl.SCANCODE_UP },

    { "numlock", sdl.SCANCODE_NUMLOCKCLEAR },
    { "kp/", sdl.SCANCODE_KP_DIVIDE },
    { "kp*", sdl.SCANCODE_KP_MULTIPLY },
    { "kp-", sdl.SCANCODE_KP_MINUS },
    { "kp+", sdl.SCANCODE_KP_PLUS },
    { "kpenter", sdl.SCANCODE_KP_ENTER },
    { "kp1", sdl.SCANCODE_KP_1 },
    { "kp2", sdl.SCANCODE_KP_2 },
    { "kp3", sdl.SCANCODE_KP_3 },
    { "kp4", sdl.SCANCODE_KP_4 },
    { "kp5", sdl.SCANCODE_KP_5 },
    { "kp6", sdl.SCANCODE_KP_6 },
    { "kp7", sdl.SCANCODE_KP_7 },
    { "kp8", sdl.SCANCODE_KP_8 },
    { "kp9", sdl.SCANCODE_KP_9 },
    { "kp0", sdl.SCANCODE_KP_0 },
    { "kp.", sdl.SCANCODE_KP_PERIOD },

    { "nonusbackslash", sdl.SCANCODE_NONUSBACKSLASH },
    { "application", sdl.SCANCODE_APPLICATION },
    { "power", sdl.SCANCODE_POWER },
    { "=", sdl.SCANCODE_KP_EQUALS },
    { "f13", sdl.SCANCODE_F13 },
    { "f14", sdl.SCANCODE_F14 },
    { "f15", sdl.SCANCODE_F15 },
    { "f16", sdl.SCANCODE_F16 },
    { "f17", sdl.SCANCODE_F17 },
    { "f18", sdl.SCANCODE_F18 },
    { "f19", sdl.SCANCODE_F19 },
    { "f20", sdl.SCANCODE_F20 },
    { "f21", sdl.SCANCODE_F21 },
    { "f22", sdl.SCANCODE_F22 },
    { "f23", sdl.SCANCODE_F23 },
    { "f24", sdl.SCANCODE_F24 },
    { "execute", sdl.SCANCODE_EXECUTE },
    { "help", sdl.SCANCODE_HELP },
    { "menu", sdl.SCANCODE_MENU },
    { "select", sdl.SCANCODE_SELECT },
    { "stop", sdl.SCANCODE_STOP },
    { "again", sdl.SCANCODE_AGAIN },
    { "undo", sdl.SCANCODE_UNDO },
    { "cut", sdl.SCANCODE_CUT },
    { "copy", sdl.SCANCODE_COPY },
    { "paste", sdl.SCANCODE_PASTE },
    { "find", sdl.SCANCODE_FIND },
    { "mute", sdl.SCANCODE_MUTE },
    { "volumeup", sdl.SCANCODE_VOLUMEUP },
    { "volumedown", sdl.SCANCODE_VOLUMEDOWN },
    { "kp,", sdl.SCANCODE_KP_COMMA },
    { "kp=400", sdl.SCANCODE_KP_EQUALSAS400 },

    { "international1", sdl.SCANCODE_INTERNATIONAL1 },
    { "international2", sdl.SCANCODE_INTERNATIONAL2 },
    { "international3", sdl.SCANCODE_INTERNATIONAL3 },
    { "international4", sdl.SCANCODE_INTERNATIONAL4 },
    { "international5", sdl.SCANCODE_INTERNATIONAL5 },
    { "international6", sdl.SCANCODE_INTERNATIONAL6 },
    { "international7", sdl.SCANCODE_INTERNATIONAL7 },
    { "international8", sdl.SCANCODE_INTERNATIONAL8 },
    { "international9", sdl.SCANCODE_INTERNATIONAL9 },
    { "lang1", sdl.SCANCODE_LANG1 },
    { "lang2", sdl.SCANCODE_LANG2 },
    { "lang3", sdl.SCANCODE_LANG3 },
    { "lang4", sdl.SCANCODE_LANG4 },
    { "lang5", sdl.SCANCODE_LANG5 },
    { "lang6", sdl.SCANCODE_LANG6 },
    { "lang7", sdl.SCANCODE_LANG7 },
    { "lang8", sdl.SCANCODE_LANG8 },
    { "lang9", sdl.SCANCODE_LANG9 },

    { "alterase", sdl.SCANCODE_ALTERASE },
    { "sysreq", sdl.SCANCODE_SYSREQ },
    { "cancel", sdl.SCANCODE_CANCEL },
    { "clear", sdl.SCANCODE_CLEAR },
    { "prior", sdl.SCANCODE_PRIOR },
    { "return2", sdl.SCANCODE_RETURN2 },
    { "separator", sdl.SCANCODE_SEPARATOR },
    { "out", sdl.SCANCODE_OUT },
    { "oper", sdl.SCANCODE_OPER },
    { "clearagain", sdl.SCANCODE_CLEARAGAIN },
    { "crsel", sdl.SCANCODE_CRSEL },
    { "exsel", sdl.SCANCODE_EXSEL },

    { "kp00", sdl.SCANCODE_KP_00 },
    { "kp000", sdl.SCANCODE_KP_000 },
    { "thsousandsseparator", sdl.SCANCODE_THOUSANDSSEPARATOR },
    { "decimalseparator", sdl.SCANCODE_DECIMALSEPARATOR },
    { "currencyunit", sdl.SCANCODE_CURRENCYUNIT },
    { "currencysubunit", sdl.SCANCODE_CURRENCYSUBUNIT },
    { "kp(", sdl.SCANCODE_KP_LEFTPAREN },
    { "kp)", sdl.SCANCODE_KP_RIGHTPAREN },
    { "kp{", sdl.SCANCODE_KP_LEFTBRACE },
    { "kp}", sdl.SCANCODE_KP_RIGHTBRACE },
    { "kptab", sdl.SCANCODE_KP_TAB },
    { "kpbackspace", sdl.SCANCODE_KP_BACKSPACE },
    { "kpa", sdl.SCANCODE_KP_A },
    { "kpb", sdl.SCANCODE_KP_B },
    { "kpc", sdl.SCANCODE_KP_C },
    { "kpd", sdl.SCANCODE_KP_D },
    { "kpe", sdl.SCANCODE_KP_E },
    { "kpf", sdl.SCANCODE_KP_F },
    { "kpxor", sdl.SCANCODE_KP_XOR },
    { "kpower", sdl.SCANCODE_KP_POWER },
    { "kp%", sdl.SCANCODE_KP_PERCENT },
    { "kp<", sdl.SCANCODE_KP_LESS },
    { "kp>", sdl.SCANCODE_KP_GREATER },
    { "kp&", sdl.SCANCODE_KP_AMPERSAND },
    { "kp&&", sdl.SCANCODE_KP_DBLAMPERSAND },
    { "kp|", sdl.SCANCODE_KP_VERTICALBAR },
    { "kp||", sdl.SCANCODE_KP_DBLVERTICALBAR },
    { "kp:", sdl.SCANCODE_KP_COLON },
    { "kp#", sdl.SCANCODE_KP_HASH },
    { "kp ", sdl.SCANCODE_KP_SPACE },
    { "kp@", sdl.SCANCODE_KP_AT },
    { "kp!", sdl.SCANCODE_KP_EXCLAM },
    { "kpmemstore", sdl.SCANCODE_KP_MEMSTORE },
    { "kpmemrecall", sdl.SCANCODE_KP_MEMRECALL },
    { "kpmemclear", sdl.SCANCODE_KP_MEMCLEAR },
    { "kpmem+", sdl.SCANCODE_KP_MEMADD },
    { "kpmem-", sdl.SCANCODE_KP_MEMSUBTRACT },
    { "kpmem*", sdl.SCANCODE_KP_MEMMULTIPLY },
    { "kpmem/", sdl.SCANCODE_KP_MEMDIVIDE },
    { "kp+-", sdl.SCANCODE_KP_PLUSMINUS },
    { "kpclear", sdl.SCANCODE_KP_CLEAR },
    { "kpclearentry", sdl.SCANCODE_KP_CLEARENTRY },
    { "kpbinary", sdl.SCANCODE_KP_BINARY },
    { "kpoctal", sdl.SCANCODE_KP_OCTAL },
    { "kpdecimal", sdl.SCANCODE_KP_DECIMAL },
    { "kphex", sdl.SCANCODE_KP_HEXADECIMAL },

    { "lctrl", sdl.SCANCODE_LCTRL },
    { "lshift", sdl.SCANCODE_LSHIFT },
    { "lalt", sdl.SCANCODE_LALT },
    { "lgui", sdl.SCANCODE_LGUI },
    { "rctrl", sdl.SCANCODE_RCTRL },
    { "rshift", sdl.SCANCODE_RSHIFT },
    { "ralt", sdl.SCANCODE_RALT },
    { "rgui", sdl.SCANCODE_RGUI },

    { "mode", sdl.SCANCODE_MODE },

    { "audionext", sdl.SCANCODE_AUDIONEXT },
    { "audioprev", sdl.SCANCODE_AUDIOPREV },
    { "audiostop", sdl.SCANCODE_AUDIOSTOP },
    { "audioplay", sdl.SCANCODE_AUDIOPLAY },
    { "audiomute", sdl.SCANCODE_AUDIOMUTE },
    { "mediaselect", sdl.SCANCODE_MEDIASELECT },
    { "www", sdl.SCANCODE_WWW },
    { "mail", sdl.SCANCODE_MAIL },
    { "calculator", sdl.SCANCODE_CALCULATOR },
    { "computer", sdl.SCANCODE_COMPUTER },
    { "acsearch", sdl.SCANCODE_AC_SEARCH },
    { "achome", sdl.SCANCODE_AC_HOME },
    { "acback", sdl.SCANCODE_AC_BACK },
    { "acforward", sdl.SCANCODE_AC_FORWARD },
    { "acstop", sdl.SCANCODE_AC_STOP },
    { "acrefresh", sdl.SCANCODE_AC_REFRESH },
    { "acbookmarks", sdl.SCANCODE_AC_BOOKMARKS },

    { "brightnessdown", sdl.SCANCODE_BRIGHTNESSDOWN },
    { "brightnessup", sdl.SCANCODE_BRIGHTNESSUP },
    { "displayswitch", sdl.SCANCODE_DISPLAYSWITCH },
    { "kbdillumtoggle", sdl.SCANCODE_KBDILLUMTOGGLE },
    { "kbdillumdown", sdl.SCANCODE_KBDILLUMDOWN },
    { "kbdillumup", sdl.SCANCODE_KBDILLUMUP },
    { "eject", sdl.SCANCODE_EJECT },
    { "sleep", sdl.SCANCODE_SLEEP },

    { "app1", sdl.SCANCODE_APP1 },
    { "app2", sdl.SCANCODE_APP2 },
}

registerKeycodes {
    { "unknown", sdl.C.SDLK_UNKNOWN },

    { "return", sdl.C.SDLK_RETURN },
    { "escape", sdl.C.SDLK_ESCAPE },
    { "backspace", sdl.C.SDLK_BACKSPACE },
    { "tab", sdl.C.SDLK_TAB },
    { "space", sdl.C.SDLK_SPACE },
    { "!", sdl.C.SDLK_EXCLAIM },
    { "\"", sdl.C.SDLK_QUOTEDBL },
    { "#", sdl.C.SDLK_HASH },
    { "%", sdl.C.SDLK_PERCENT },
    { "$", sdl.C.SDLK_DOLLAR },
    { "&", sdl.C.SDLK_AMPERSAND },
    { "'", sdl.C.SDLK_QUOTE },
    { "(", sdl.C.SDLK_LEFTPAREN },
    { ")", sdl.C.SDLK_RIGHTPAREN },
    { "*", sdl.C.SDLK_ASTERISK },
    { "+", sdl.C.SDLK_PLUS },
    { ",", sdl.C.SDLK_COMMA },
    { "-", sdl.C.SDLK_MINUS },
    { ".", sdl.C.SDLK_PERIOD },
    { "/", sdl.C.SDLK_SLASH },
    { "0", sdl.C.SDLK_0 },
    { "1", sdl.C.SDLK_1 },
    { "2", sdl.C.SDLK_2 },
    { "3", sdl.C.SDLK_3 },
    { "4", sdl.C.SDLK_4 },
    { "5", sdl.C.SDLK_5 },
    { "6", sdl.C.SDLK_6 },
    { "7", sdl.C.SDLK_7 },
    { "8", sdl.C.SDLK_8 },
    { "9", sdl.C.SDLK_9 },
    { ":", sdl.C.SDLK_COLON },
    { ";", sdl.C.SDLK_SEMICOLON },
    { "<", sdl.C.SDLK_LESS },
    { "=", sdl.C.SDLK_EQUALS },
    { ">", sdl.C.SDLK_GREATER },
    { "?", sdl.C.SDLK_QUESTION },
    { "@", sdl.C.SDLK_AT },

    { "[", sdl.C.SDLK_LEFTBRACKET },
    { "\\", sdl.C.SDLK_BACKSLASH },
    { "]", sdl.C.SDLK_RIGHTBRACKET },
    { "^", sdl.C.SDLK_CARET },
    { "_", sdl.C.SDLK_UNDERSCORE },
    { "`", sdl.C.SDLK_BACKQUOTE },
    { "a", sdl.C.SDLK_a },
    { "b", sdl.C.SDLK_b },
    { "c", sdl.C.SDLK_c },
    { "d", sdl.C.SDLK_d },
    { "e", sdl.C.SDLK_e },
    { "f", sdl.C.SDLK_f },
    { "g", sdl.C.SDLK_g },
    { "h", sdl.C.SDLK_h },
    { "i", sdl.C.SDLK_i },
    { "j", sdl.C.SDLK_j },
    { "k", sdl.C.SDLK_k },
    { "l", sdl.C.SDLK_l },
    { "m", sdl.C.SDLK_m },
    { "n", sdl.C.SDLK_n },
    { "o", sdl.C.SDLK_o },
    { "p", sdl.C.SDLK_p },
    { "q", sdl.C.SDLK_q },
    { "r", sdl.C.SDLK_r },
    { "s", sdl.C.SDLK_s },
    { "t", sdl.C.SDLK_t },
    { "u", sdl.C.SDLK_u },
    { "v", sdl.C.SDLK_v },
    { "w", sdl.C.SDLK_w },
    { "x", sdl.C.SDLK_x },
    { "y", sdl.C.SDLK_y },
    { "z", sdl.C.SDLK_z },

    { "capslock", sdl.C.SDLK_CAPSLOCK },

    { "f1", sdl.C.SDLK_F1 },
    { "f2", sdl.C.SDLK_F2 },
    { "f3", sdl.C.SDLK_F3 },
    { "f4", sdl.C.SDLK_F4 },
    { "f5", sdl.C.SDLK_F5 },
    { "f6", sdl.C.SDLK_F6 },
    { "f7", sdl.C.SDLK_F7 },
    { "f8", sdl.C.SDLK_F8 },
    { "f9", sdl.C.SDLK_F9 },
    { "f10", sdl.C.SDLK_F10 },
    { "f11", sdl.C.SDLK_F11 },
    { "f12", sdl.C.SDLK_F12 },

    { "printscreen", sdl.C.SDLK_PRINTSCREEN },
    { "scrolllock", sdl.C.SDLK_SCROLLLOCK },
    { "pause", sdl.C.SDLK_PAUSE },
    { "insert", sdl.C.SDLK_INSERT },
    { "home", sdl.C.SDLK_HOME },
    { "pageup", sdl.C.SDLK_PAGEUP },
    { "delete", sdl.C.SDLK_DELETE },
    { "end", sdl.C.SDLK_END },
    { "pagedown", sdl.C.SDLK_PAGEDOWN },
    { "right", sdl.C.SDLK_RIGHT },
    { "left", sdl.C.SDLK_LEFT },
    { "down", sdl.C.SDLK_DOWN },
    { "up", sdl.C.SDLK_UP },

    { "numlock", sdl.C.SDLK_NUMLOCKCLEAR },
    { "kp/", sdl.C.SDLK_KP_DIVIDE },
    { "kp*", sdl.C.SDLK_KP_MULTIPLY },
    { "kp-", sdl.C.SDLK_KP_MINUS },
    { "kp+", sdl.C.SDLK_KP_PLUS },
    { "kpenter", sdl.C.SDLK_KP_ENTER },
    { "kp0", sdl.C.SDLK_KP_0 },
    { "kp1", sdl.C.SDLK_KP_1 },
    { "kp2", sdl.C.SDLK_KP_2 },
    { "kp3", sdl.C.SDLK_KP_3 },
    { "kp4", sdl.C.SDLK_KP_4 },
    { "kp5", sdl.C.SDLK_KP_5 },
    { "kp6", sdl.C.SDLK_KP_6 },
    { "kp7", sdl.C.SDLK_KP_7 },
    { "kp8", sdl.C.SDLK_KP_8 },
    { "kp9", sdl.C.SDLK_KP_9 },
    { "kp.", sdl.C.SDLK_KP_PERIOD },
    { "kp,", sdl.C.SDLK_KP_COMMA },
    { "kp=", sdl.C.SDLK_KP_EQUALS },

    { "application", sdl.C.SDLK_APPLICATION },
    { "power", sdl.C.SDLK_POWER },
    { "f13", sdl.C.SDLK_F13 },
    { "f14", sdl.C.SDLK_F14 },
    { "f15", sdl.C.SDLK_F15 },
    { "f16", sdl.C.SDLK_F16 },
    { "f17", sdl.C.SDLK_F17 },
    { "f18", sdl.C.SDLK_F18 },
    { "f19", sdl.C.SDLK_F19 },
    { "f20", sdl.C.SDLK_F20 },
    { "f21", sdl.C.SDLK_F21 },
    { "f22", sdl.C.SDLK_F22 },
    { "f23", sdl.C.SDLK_F23 },
    { "f24", sdl.C.SDLK_F24 },
    { "execute", sdl.C.SDLK_EXECUTE },
    { "help", sdl.C.SDLK_HELP },
    { "menu", sdl.C.SDLK_MENU },
    { "select", sdl.C.SDLK_SELECT },
    { "stop", sdl.C.SDLK_STOP },
    { "again", sdl.C.SDLK_AGAIN },
    { "undo", sdl.C.SDLK_UNDO },
    { "cut", sdl.C.SDLK_CUT },
    { "copy", sdl.C.SDLK_COPY },
    { "paste", sdl.C.SDLK_PASTE },
    { "find", sdl.C.SDLK_FIND },
    { "mute", sdl.C.SDLK_MUTE },
    { "volumeup", sdl.C.SDLK_VOLUMEUP },
    { "volumedown", sdl.C.SDLK_VOLUMEDOWN },

    { "alterase", sdl.C.SDLK_ALTERASE },
    { "sysreq", sdl.C.SDLK_SYSREQ },
    { "cancel", sdl.C.SDLK_CANCEL },
    { "clear", sdl.C.SDLK_CLEAR },
    { "prior", sdl.C.SDLK_PRIOR },
    { "return2", sdl.C.SDLK_RETURN2 },
    { "separator", sdl.C.SDLK_SEPARATOR },
    { "out", sdl.C.SDLK_OUT },
    { "oper", sdl.C.SDLK_OPER },
    { "clearagain", sdl.C.SDLK_CLEARAGAIN },

    { "thsousandsseparator", sdl.C.SDLK_THOUSANDSSEPARATOR },
    { "decimalseparator", sdl.C.SDLK_DECIMALSEPARATOR },
    { "currencyunit", sdl.C.SDLK_CURRENCYUNIT },
    { "currencysubunit", sdl.C.SDLK_CURRENCYSUBUNIT },

    { "lctrl", sdl.C.SDLK_LCTRL },
    { "lshift", sdl.C.SDLK_LSHIFT },
    { "lalt", sdl.C.SDLK_LALT },
    { "lgui", sdl.C.SDLK_LGUI },
    { "rctrl", sdl.C.SDLK_RCTRL },
    { "rshift", sdl.C.SDLK_RSHIFT },
    { "ralt", sdl.C.SDLK_RALT },
    { "rgui", sdl.C.SDLK_RGUI },

    { "mode", sdl.C.SDLK_MODE },

    { "audionext", sdl.C.SDLK_AUDIONEXT },
    { "audioprev", sdl.C.SDLK_AUDIOPREV },
    { "audiostop", sdl.C.SDLK_AUDIOSTOP },
    { "audioplay", sdl.C.SDLK_AUDIOPLAY },
    { "audiomute", sdl.C.SDLK_AUDIOMUTE },
    { "mediaselect", sdl.C.SDLK_MEDIASELECT },
    { "www", sdl.C.SDLK_WWW },
    { "mail", sdl.C.SDLK_MAIL },
    { "calculator", sdl.C.SDLK_CALCULATOR },
    { "computer", sdl.C.SDLK_COMPUTER },

    { "appsearch", sdl.C.SDLK_AC_SEARCH },
    { "apphome", sdl.C.SDLK_AC_HOME },
    { "appback", sdl.C.SDLK_AC_BACK },
    { "appforward", sdl.C.SDLK_AC_FORWARD },
    { "appstop", sdl.C.SDLK_AC_STOP },
    { "apprefresh", sdl.C.SDLK_AC_REFRESH },
    { "appbookmarks", sdl.C.SDLK_AC_BOOKMARKS },

    { "brightnessdown", sdl.C.SDLK_BRIGHTNESSDOWN },
    { "brightnessup", sdl.C.SDLK_BRIGHTNESSUP },
    { "displayswitch", sdl.C.SDLK_DISPLAYSWITCH },
    { "kbdillumtoggle", sdl.C.SDLK_KBDILLUMTOGGLE },
    { "kbdillumdown", sdl.C.SDLK_KBDILLUMDOWN },
    { "kbdillumup", sdl.C.SDLK_KBDILLUMUP },
    { "eject", sdl.C.SDLK_EJECT },
    { "sleep", sdl.C.SDLK_SLEEP },
}

return Keyboard
