#[lang = "usize"]
impl usize {
    pub fn min(self, other: usize) -> usize {
        if self < other {
            self
        } else {
            other
        }
    }
}
