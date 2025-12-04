#![feature(lang_items, no_core)]
#![feature(start)]
#![no_std]

// #[lang = "eh_personality"]
// #[no_mangle]
// pub extern "C" fn rust_eh_personality() {}
//
// #[lang = "panic_fmt"]
// #[no_mangle]
// pub extern "C" fn rust_begin_panic(
//     _msg: core::fmt::Arguments,
//     _file: &'static str,
//     _line: u32,
// ) -> ! {
// }

extern "C" {
    fn gotoxy(x: u8, y: u8);
    fn cprintf(fmt: *const u8, ...);
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    // unsafe {
    //     gotoxy(10, 10);
    //     cprintf(b"Hello, world!\0".as_ptr());
    // }
    //
    // // 処理を終わらせないための無限ループ
    // loop {}
}
