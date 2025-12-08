#![feature(no_core)]
#![no_core]
#![no_main]

#[macro_use]
extern crate cc65;

use cc65::{cprintf, get_screen_size, goto_xy};

fn fizz_buzz(n: u8) {
    let mut i = 1;
    while i <= n {
        goto_xy(0, i - 1);
        match (i % 3, i % 5) {
            (0, 0) => cprintf!(b"FizzBuzz\0"),
            (0, _) => cprintf!(b"Fizz\0"),
            (_, 0) => cprintf!(b"Buzz\0"),
            _ => cprintf!(b"%d\0", i),
        }
        i += 1;
    }
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    let (_, height) = get_screen_size();
    fizz_buzz(height);

    loop {}
}
