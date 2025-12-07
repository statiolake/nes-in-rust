#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![feature(start)]
#![no_core]
#![no_main]

extern "C" {
    #[no_mangle]
    fn gotoxy(x: u8, y: u8);

    #[no_mangle]
    fn cprintf(fmt: *const u8, ...);
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    cprintf(b"hello\0" as *const u8);

    loop {}
}
