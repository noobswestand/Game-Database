///scr_keyboardInit()

global.dll_keyboard_press=external_define("KeyboardDLL.dll",'keyPress',dll_cdecl,ty_real,1,ty_real)
global.dll_keyboard_release=external_define("KeyboardDLL.dll",'keyRelease',dll_cdecl,ty_real,1,ty_real)
global.dll_keyboard_sleep=external_define("KeyboardDLL.dll",'__sleep',dll_cdecl,ty_real,1,ty_real)
