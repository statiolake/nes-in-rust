#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![feature(start)]
#![no_core]
#![no_main]

extern "C" {
    #[no_mangle]
    fn screensize(x: *mut u8, y: *mut u8);

    #[no_mangle]
    fn gotoxy(x: u8, y: u8);

    #[no_mangle]
    fn cprintf(fmt: *const u8, ...);
}

fn print_at_center<const N: usize>(line: u8, s: &[u8; N]) {
    let (mut width, mut height) = (0u8, 0u8);
    unsafe {
        screensize(&mut width as *mut u8, &mut height as *mut u8);
    }

    let padding = (width - N as u8) / 2;

    unsafe {
        gotoxy(padding, line);
        cprintf(s as *const u8);
    }
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    print_at_center(5, b"HELLO NES FROM RUST!\0");
    print_at_center(15, b"ADVENT CALENDAR 2025\0");
    print_at_center(20, b"STATIOLAKE\0");

    loop {}
}
