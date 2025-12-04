#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![no_core]

#[lang = "sized"]
trait Sized {}

pub mod ops {
    pub struct RangeFull;
}

#[alloc_error_handler]
fn alloc_error_handler(_layout: ()) -> ! {
    loop {}
}

#[panic_implementation]
pub fn panic_impl(_info: ()) -> ! {
    loop {}
}

#[no_mangle]
extern "C" fn __rdl_alloc() {
    loop {}
}

#[no_mangle]
extern "C" fn __rdl_alloc_zeroed() {
    loop {}
}

#[no_mangle]
extern "C" fn __rdl_dealloc() {
    loop {}
}

#[no_mangle]
extern "C" fn __rdl_realloc() {
    loop {}
}

#[no_mangle]
extern "C" fn _Unwind_Resume() {
    loop {}
}
