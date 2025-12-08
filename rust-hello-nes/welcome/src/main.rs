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

// fn get_screen_size() -> (u8, u8) {
//     let (mut width, mut height) = (0u8, 0u8);
//     unsafe {
//         screensize(&mut width as *mut u8, &mut height as *mut u8);
//     }
//     (width, height)
// }

fn print_at_center<const N: usize>(line: u8, s: &[u8; N]) {
    // let (width, _) = get_screen_size();
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

// fn fizz_buzz(n: u8) {
//     let mut i = 1;
//     while i <= n {
//         match (i % 3, i % 5) {
//             (0, 0) => unsafe { cprintf(b"FizzBuzz\n\0" as *const u8) },
//             (0, _) => unsafe { cprintf(b"Fizz\n\0" as *const u8) },
//             (_, 0) => unsafe { cprintf(b"Buzz\n\0" as *const u8) },
//             _ => unsafe { cprintf(b"%d\n\0" as *const u8, i) },
//             _ => loop {},
//         }
//         i += 1;
//     }
// }

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    // let (_, height) = get_screen_size();
    // fizz_buzz(height);

    print_at_center(5, b"HELLO NES FROM RUST!\0");
    print_at_center(15, b"ADVENT CALENDAR 2025\0");
    print_at_center(20, b"STATIOLAKE\0");

    loop {}
}
