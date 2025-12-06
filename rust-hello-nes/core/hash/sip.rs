// Copyright 2012-2015 The Rust Project Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://rust-lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

//! An implementation of SipHash.

#![allow(deprecated)]

use cmp;
use marker::PhantomData;
use mem;
use ptr;

/// An implementation of SipHash 1-3.
///
/// This is currently the default hashing function used by standard library
/// (eg. `collections::HashMap` uses it by default).
///
/// See: <https://131002.net/siphash>
#[unstable(feature = "hashmap_internals", issue = "0")]
#[rustc_deprecated(
    since = "1.13.0",
    reason = "use `std::collections::hash_map::DefaultHasher` instead"
)]
#[derive(Debug, Clone, Default)]
#[doc(hidden)]
pub struct SipHasher13 {}

/// An implementation of SipHash 2-4.
///
/// See: <https://131002.net/siphash/>
#[unstable(feature = "hashmap_internals", issue = "0")]
#[rustc_deprecated(
    since = "1.13.0",
    reason = "use `std::collections::hash_map::DefaultHasher` instead"
)]
#[derive(Debug, Clone, Default)]
struct SipHasher24 {}

/// An implementation of SipHash 2-4.
///
/// See: <https://131002.net/siphash/>
///
/// SipHash is a general-purpose hashing function: it runs at a good
/// speed (competitive with Spooky and City) and permits strong _keyed_
/// hashing. This lets you key your hashtables from a strong RNG, such as
/// [`rand::os::OsRng`](https://doc.rust-lang.org/rand/rand/os/struct.OsRng.html).
///
/// Although the SipHash algorithm is considered to be generally strong,
/// it is not intended for cryptographic purposes. As such, all
/// cryptographic uses of this implementation are _strongly discouraged_.
#[stable(feature = "rust1", since = "1.0.0")]
#[rustc_deprecated(
    since = "1.13.0",
    reason = "use `std::collections::hash_map::DefaultHasher` instead"
)]
#[derive(Debug, Clone, Default)]
pub struct SipHasher(SipHasher24);

#[derive(Debug)]
struct Hasher<S: Sip> {
    _marker: PhantomData<S>,
}

#[derive(Debug, Clone, Copy)]
#[repr(C)]
struct State {}

impl SipHasher {
    /// Creates a new `SipHasher` with the two initial keys set to 0.
    #[inline]
    #[stable(feature = "rust1", since = "1.0.0")]
    #[rustc_deprecated(
        since = "1.13.0",
        reason = "use `std::collections::hash_map::DefaultHasher` instead"
    )]
    pub fn new() -> SipHasher {
        unimplemented!()
    }

    /// Creates a `SipHasher` that is keyed off the provided keys.
    #[inline]
    #[stable(feature = "rust1", since = "1.0.0")]
    #[rustc_deprecated(
        since = "1.13.0",
        reason = "use `std::collections::hash_map::DefaultHasher` instead"
    )]
    pub fn new_with_keys(key0: u64, key1: u64) -> SipHasher {
        unimplemented!()
    }
}

impl SipHasher13 {
    /// Creates a new `SipHasher13` with the two initial keys set to 0.
    #[inline]
    #[unstable(feature = "hashmap_internals", issue = "0")]
    #[rustc_deprecated(
        since = "1.13.0",
        reason = "use `std::collections::hash_map::DefaultHasher` instead"
    )]
    pub fn new() -> SipHasher13 {
        unimplemented!()
    }

    /// Creates a `SipHasher13` that is keyed off the provided keys.
    #[inline]
    #[unstable(feature = "hashmap_internals", issue = "0")]
    #[rustc_deprecated(
        since = "1.13.0",
        reason = "use `std::collections::hash_map::DefaultHasher` instead"
    )]
    pub fn new_with_keys(key0: u64, key1: u64) -> SipHasher13 {
        unimplemented!()
    }
}

impl<S: Sip> super::Hasher for Hasher<S> {
    // see short_write comment for explanation
    #[inline]
    fn write_usize(&mut self, i: usize) {
        unimplemented!()
    }

    // see short_write comment for explanation
    #[inline]
    fn write_u8(&mut self, i: u8) {
        unimplemented!()
    }

    #[inline]
    fn write(&mut self, msg: &[u8]) {
        unimplemented!()
    }

    #[inline]
    fn finish(&self) -> u64 {
        unimplemented!()
    }
}

impl<S: Sip> Clone for Hasher<S> {
    #[inline]
    fn clone(&self) -> Hasher<S> {
        Hasher {
            _marker: PhantomData,
        }
    }
}

impl<S: Sip> Default for Hasher<S> {
    /// Creates a `Hasher<S>` with the two initial keys set to 0.
    #[inline]
    fn default() -> Hasher<S> {
        Hasher {
            _marker: PhantomData,
        }
    }
}

#[doc(hidden)]
trait Sip {
    fn c_rounds(_: &mut State);
    fn d_rounds(_: &mut State);
}

#[derive(Debug, Clone, Default)]
struct Sip13Rounds;

impl Sip for Sip13Rounds {
    #[inline]
    fn c_rounds(state: &mut State) {
        unimplemented!()
    }

    #[inline]
    fn d_rounds(state: &mut State) {
        unimplemented!()
    }
}

#[derive(Debug, Clone, Default)]
struct Sip24Rounds;

impl Sip for Sip24Rounds {
    #[inline]
    fn c_rounds(state: &mut State) {
        unimplemented!()
    }

    #[inline]
    fn d_rounds(state: &mut State) {
        unimplemented!()
    }
}
