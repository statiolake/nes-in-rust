#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![no_core]

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

#[no_mangle]
extern "C" fn write() {
    loop {}
}

pub mod prelude;
#[prelude_import]
#[allow(unused)]
use prelude::v1::*;

#[macro_use]
pub mod internal_macros;

pub mod clone;
pub mod cmp;
pub mod intrinsics;
pub mod marker;
pub mod num;
pub mod ops;
pub mod option;
pub mod ptr;
pub mod result;
pub mod slice;
pub mod str;
