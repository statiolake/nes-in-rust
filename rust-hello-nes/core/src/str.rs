#[lang = "str"]
impl str {
    pub fn len(&self) -> usize {
        self.as_bytes().len()
    }

    pub fn as_bytes(&self) -> &[u8] {
        union Slices<'a> {
            str: &'a str,
            slice: &'a [u8],
        }
        unsafe { Slices { str: self }.slice }
    }

    pub fn as_ptr(&self) -> *const u8 {
        self as *const str as *const u8
    }
}
