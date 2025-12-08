#![feature(no_core)]
#![no_core]

extern "C" {
    #[no_mangle]
    fn screensize(x: *mut u8, y: *mut u8);

    #[no_mangle]
    fn gotoxy(x: u8, y: u8);

    #[no_mangle]
    fn cprintf(fmt: *const u8, ...);
}

#[macro_export]
macro_rules! cprintf {
    ($fmt:expr $(, $arg:expr)*) => {
        unsafe {
            $crate::cprintf($fmt as *const u8, $($arg),*);
        }
    };
}

pub fn get_screen_size() -> (u8, u8) {
    let (mut width, mut height) = (0u8, 0u8);
    unsafe {
        screensize(&mut width as *mut u8, &mut height as *mut u8);
    }

    (width, height)
}

pub fn goto_xy(x: u8, y: u8) {
    unsafe {
        gotoxy(x, y);
    }
}
