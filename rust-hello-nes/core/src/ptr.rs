pub unsafe fn copy<T>(src: *const T, dst: *mut T, count: usize) {
    unsafe { crate::intrinsics::copy(src, dst, count) }
}
