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

// fn fizz_buzz(n: u8) {
//     for i in 1..=n {
//         match (i % 3, i % 5) {
//             (0, 0) => unsafe { cprintf(b"FizzBuzz\n\0" as *const u8) },
//             (0, _) => unsafe { cprintf(b"Fizz\n\0" as *const u8) },
//             (_, 0) => unsafe { cprintf(b"Buzz\n\0" as *const u8) },
//             _ => unsafe { cprintf(b"%d\n\0" as *const u8, i) },
//         }
//     }
// }

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    cprintf(b"hello\0" as *const u8);
    // fizz_buzz(20);

    loop {}
}
