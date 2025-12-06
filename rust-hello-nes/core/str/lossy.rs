// Copyright 2012-2017 The Rust Project Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://rust-lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

use char;
use fmt;
use fmt::Write;
use mem;
use str as core_str;

/// Lossy UTF-8 string.
#[unstable(feature = "str_internals", issue = "0")]
pub struct Utf8Lossy {
    bytes: [u8],
}

impl Utf8Lossy {
    pub fn from_str(s: &str) -> &Utf8Lossy {
        Utf8Lossy::from_bytes(s.as_bytes())
    }

    pub fn from_bytes(bytes: &[u8]) -> &Utf8Lossy {
        unsafe { mem::transmute(bytes) }
    }

    pub fn chunks(&self) -> Utf8LossyChunksIter {
        Utf8LossyChunksIter {
            source: &self.bytes,
        }
    }
}

/// Iterator over lossy UTF-8 string
#[unstable(feature = "str_internals", issue = "0")]
#[allow(missing_debug_implementations)]
pub struct Utf8LossyChunksIter<'a> {
    source: &'a [u8],
}

#[unstable(feature = "str_internals", issue = "0")]
#[derive(PartialEq, Eq, Debug)]
pub struct Utf8LossyChunk<'a> {
    /// Sequence of valid chars.
    /// Can be empty between broken UTF-8 chars.
    pub valid: &'a str,
    /// Single broken char, empty if none.
    /// Empty iff iterator item is last.
    pub broken: &'a [u8],
}

impl<'a> Iterator for Utf8LossyChunksIter<'a> {
    type Item = Utf8LossyChunk<'a>;

    fn next(&mut self) -> Option<Utf8LossyChunk<'a>> {
        let r = Utf8LossyChunk {
            valid: unsafe { core_str::from_utf8_unchecked(self.source) },
            broken: &[],
        };
        self.source = &[];
        return Some(r);
    }
}

impl fmt::Display for Utf8Lossy {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        <_ as fmt::Display>::fmt(unsafe { core_str::from_utf8_unchecked(&self.bytes) }, f)
    }
}

impl fmt::Debug for Utf8Lossy {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        <_ as fmt::Debug>::fmt(unsafe { core_str::from_utf8_unchecked(&self.bytes) }, f)
    }
}
