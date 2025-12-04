extern "C" {
    fn gotoxy(x: u8, y: u8);
    fn cprintf(fmt: *const u8, ...);
}

fn main() {
    unsafe {
        gotoxy(10, 10);
        cprintf(b"Hello, world!\0".as_ptr());
    }

    // 処理を終わらせないための無限ループ
    loop {}
}
