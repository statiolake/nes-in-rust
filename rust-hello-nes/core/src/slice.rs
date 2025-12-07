#[lang = "slice"]
impl<T> [T] {
    pub fn len(&self) -> usize {
        unsafe { crate::intrinsics::mrustc_slice_len(self as *const [T]) }
    }

    pub fn as_mut_ptr(&mut self) -> *mut T {
        self as *mut [T] as *mut T
    }
}
