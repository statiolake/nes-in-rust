#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Option<T> {
    Some(T),
    None,
}

impl<T> Option<T> {
    pub fn is_some(&self) -> bool {
        match self {
            Option::Some(_) => true,
            Option::None => false,
        }
    }

    pub fn is_none(&self) -> bool {
        !self.is_some()
    }

    pub fn unwrap_or_else<F>(self, f: F) -> T
    where
        F: FnOnce() -> T,
    {
        match self {
            Option::Some(v) => v,
            Option::None => f(),
        }
    }

    pub fn unwrap_or_default(self) -> T {
        match self {
            Option::Some(v) => v,
            Option::None => loop {},
        }
    }
}
