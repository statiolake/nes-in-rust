extern "rust-intrinsic" {
    pub fn copy<T>(src: *const T, dst: *mut T, count: usize);

    pub fn mrustc_slice_len<T>(pointer: *const [T]) -> usize;
}
