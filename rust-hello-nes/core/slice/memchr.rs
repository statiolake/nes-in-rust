// Copyright 2015 The Rust Project Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://rust-lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.
//
// Original implementation taken from rust-memchr
// Copyright 2015 Andrew Gallant, bluss and Nicolas Koch

use cmp;
use mem;

// const LO_U64: u64 = 0x0101010101010101;
// const HI_U64: u64 = 0x8080808080808080;

// // use truncation
// const LO_USIZE: usize = LO_U64 as usize;
// const HI_USIZE: usize = HI_U64 as usize;

// // For u16 search
// const LO_U16: u16 = 0x0101;
// const HI_U16: u16 = 0x8080;

// // For u32 search
// const LO_U32: u32 = 0x01010101;
// const HI_U32: u32 = 0x80808080;

// /// Return `true` if `x` contains any zero byte.
// ///
// /// From *Matters Computational*, J. Arndt
// ///
// /// "The idea is to subtract one from each of the bytes and then look for
// /// bytes where the borrow propagated all the way to the most significant
// /// bit."
// #[inline]
// fn contains_zero_byte(x: usize) -> bool {
//     x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
// }

// #[cfg(target_pointer_width = "16")]
// #[inline]
// fn repeat_byte(b: u8) -> usize {
//     (b as usize) << 8 | b as usize
// }

// #[cfg(not(target_pointer_width = "16"))]
// #[inline]
// fn repeat_byte(b: u8) -> usize {
//     (b as usize) * (::usize::MAX / 255)
// }

/// Return the first index matching the byte `x` in `text`.
pub fn memchr(x: u8, text: &[u8]) -> Option<usize> {
    text.iter().position(|y| x == *y)
    // // Scan for a single byte value by reading two `usize` words at a time.
    // //
    // // Split `text` in three parts
    // // - unaligned initial part, before the first word aligned address in text
    // // - body, scan by 2 words at a time
    // // - the last remaining part, < 2 word size
    // let len = text.len();
    // let ptr = text.as_ptr();
    // let usize_bytes = mem::size_of::<usize>();

    // // search up to an aligned boundary
    // let mut offset = ptr.align_offset(usize_bytes);
    // if offset > 0 {
    //     offset = cmp::min(offset, len);
    //     if let Some(index) = text[..offset].iter().position(|elt| *elt == x) {
    //         return Some(index);
    //     }
    // }

    // // search the body of the text
    // let repeated_x = repeat_byte(x);

    // if len >= 2 * usize_bytes {
    //     while offset <= len - 2 * usize_bytes {
    //         unsafe {
    //             let u = *(ptr.offset(offset as isize) as *const usize);
    //             let v = *(ptr.offset((offset + usize_bytes) as isize) as *const usize);

    //             // break if there is a matching byte
    //             let zu = contains_zero_byte(u ^ repeated_x);
    //             let zv = contains_zero_byte(v ^ repeated_x);
    //             if zu || zv {
    //                 break;
    //             }
    //         }
    //         offset += usize_bytes * 2;
    //     }
    // }

    // // find the byte after the point the body loop stopped
    // text[offset..].iter().position(|elt| *elt == x).map(|i| offset + i)
}

/// Return the last index matching the byte `x` in `text`.
pub fn memrchr(x: u8, text: &[u8]) -> Option<usize> {
    text.iter().rposition(|y| x == *y)
    // // Scan for a single byte value by reading two `usize` words at a time.
    // //
    // // Split `text` in three parts
    // // - unaligned tail, after the last word aligned address in text
    // // - body, scan by 2 words at a time
    // // - the first remaining bytes, < 2 word size
    // let len = text.len();
    // let ptr = text.as_ptr();
    // let usize_bytes = mem::size_of::<usize>();

    // let mut offset = {
    //     // We call this just to obtain the length of the suffix
    //     let (_, _, suffix) = unsafe { text.align_to::<usize>() };
    //     len - suffix.len()
    // };
    // if let Some(index) = text[offset..].iter().rposition(|elt| *elt == x) {
    //     return Some(offset + index);
    // }

    // // search the body of the text
    // let repeated_x = repeat_byte(x);

    // while offset >= 2 * usize_bytes {
    //     unsafe {
    //         let u = *(ptr.offset(offset as isize - 2 * usize_bytes as isize) as *const usize);
    //         let v = *(ptr.offset(offset as isize - usize_bytes as isize) as *const usize);

    //         // break if there is a matching byte
    //         let zu = contains_zero_byte(u ^ repeated_x);
    //         let zv = contains_zero_byte(v ^ repeated_x);
    //         if zu || zv {
    //             break;
    //         }
    //     }
    //     offset -= 2 * usize_bytes;
    // }

    // // find the byte before the point the body loop stopped
    // text[..offset].iter().rposition(|elt| *elt == x)
}

// // u16 support

// #[inline]
// fn contains_zero_u16(x: u16) -> bool {
//     x.wrapping_sub(LO_U16) & !x & HI_U16 != 0
// }

// #[inline]
// fn repeat_u16(b: u8) -> u16 {
//     (b as u16) << 8 | b as u16
// }

// /// Return the first index matching the byte `x` in `text` (u16 slice).
// pub fn memchr_u16(x: u8, text: &[u16]) -> Option<usize> {
//     let len = text.len();
//     let ptr = text.as_ptr();
//     let u16_size = mem::size_of::<u16>();

//     let mut offset = ptr.align_offset(u16_size);
//     if offset > 0 {
//         offset = cmp::min(offset, len);
//         if let Some(index) = text[..offset]
//             .iter()
//             .position(|elt| (*elt & 0xFF) as u8 == x || ((*elt >> 8) & 0xFF) as u8 == x)
//         {
//             return Some(index);
//         }
//     }

//     let repeated_x = repeat_u16(x);

//     if len >= 2 {
//         while offset <= len - 2 {
//             unsafe {
//                 let u = *ptr.offset(offset as isize);
//                 let v = *ptr.offset((offset + 1) as isize);

//                 let zu = contains_zero_u16(u ^ repeated_x);
//                 let zv = contains_zero_u16(v ^ repeated_x);
//                 if zu || zv {
//                     break;
//                 }
//             }
//             offset += 2;
//         }
//     }

//     text[offset..]
//         .iter()
//         .position(|elt| (*elt & 0xFF) as u8 == x || ((*elt >> 8) & 0xFF) as u8 == x)
//         .map(|i| offset + i)
// }

// /// Return the last index matching the byte `x` in `text` (u16 slice).
// pub fn memrchr_u16(x: u8, text: &[u16]) -> Option<usize> {
//     let len = text.len();
//     let ptr = text.as_ptr();

//     let mut offset = {
//         let (_, _, suffix) = unsafe { text.align_to::<u16>() };
//         len - suffix.len()
//     };
//     if let Some(index) = text[offset..]
//         .iter()
//         .rposition(|elt| (*elt & 0xFF) as u8 == x || ((*elt >> 8) & 0xFF) as u8 == x)
//     {
//         return Some(offset + index);
//     }

//     let repeated_x = repeat_u16(x);

//     while offset >= 2 {
//         unsafe {
//             let u = *ptr.offset(offset as isize - 2);
//             let v = *ptr.offset(offset as isize - 1);

//             let zu = contains_zero_u16(u ^ repeated_x);
//             let zv = contains_zero_u16(v ^ repeated_x);
//             if zu || zv {
//                 break;
//             }
//         }
//         offset -= 2;
//     }

//     text[..offset]
//         .iter()
//         .rposition(|elt| (*elt & 0xFF) as u8 == x || ((*elt >> 8) & 0xFF) as u8 == x)
// }

// // u32 support

// #[inline]
// fn contains_zero_u32(x: u32) -> bool {
//     x.wrapping_sub(LO_U32) & !x & HI_U32 != 0
// }

// #[inline]
// fn repeat_u32(b: u8) -> u32 {
//     (b as u32) * 0x01010101
// }

// /// Return the first index matching the byte `x` in `text` (u32 slice).
// pub fn memchr_u32(x: u8, text: &[u32]) -> Option<usize> {
//     let len = text.len();
//     let ptr = text.as_ptr();
//     let u32_size = mem::size_of::<u32>();

//     let mut offset = ptr.align_offset(u32_size);
//     if offset > 0 {
//         offset = cmp::min(offset, len);
//         if let Some(index) = text[..offset].iter().position(|elt| {
//             (*elt & 0xFF) as u8 == x
//                 || ((*elt >> 8) & 0xFF) as u8 == x
//                 || ((*elt >> 16) & 0xFF) as u8 == x
//                 || ((*elt >> 24) & 0xFF) as u8 == x
//         }) {
//             return Some(index);
//         }
//     }

//     let repeated_x = repeat_u32(x);

//     if len >= 2 {
//         while offset <= len - 2 {
//             unsafe {
//                 let u = *ptr.offset(offset as isize);
//                 let v = *ptr.offset((offset + 1) as isize);

//                 let zu = contains_zero_u32(u ^ repeated_x);
//                 let zv = contains_zero_u32(v ^ repeated_x);
//                 if zu || zv {
//                     break;
//                 }
//             }
//             offset += 2;
//         }
//     }

//     text[offset..]
//         .iter()
//         .position(|elt| {
//             (*elt & 0xFF) as u8 == x
//                 || ((*elt >> 8) & 0xFF) as u8 == x
//                 || ((*elt >> 16) & 0xFF) as u8 == x
//                 || ((*elt >> 24) & 0xFF) as u8 == x
//         })
//         .map(|i| offset + i)
// }

// /// Return the last index matching the byte `x` in `text` (u32 slice).
// pub fn memrchr_u32(x: u8, text: &[u32]) -> Option<usize> {
//     let len = text.len();
//     let ptr = text.as_ptr();

//     let mut offset = {
//         let (_, _, suffix) = unsafe { text.align_to::<u32>() };
//         len - suffix.len()
//     };
//     if let Some(index) = text[offset..].iter().rposition(|elt| {
//         (*elt & 0xFF) as u8 == x
//             || ((*elt >> 8) & 0xFF) as u8 == x
//             || ((*elt >> 16) & 0xFF) as u8 == x
//             || ((*elt >> 24) & 0xFF) as u8 == x
//     }) {
//         return Some(offset + index);
//     }

//     let repeated_x = repeat_u32(x);

//     while offset >= 2 {
//         unsafe {
//             let u = *ptr.offset(offset as isize - 2);
//             let v = *ptr.offset(offset as isize - 1);

//             let zu = contains_zero_u32(u ^ repeated_x);
//             let zv = contains_zero_u32(v ^ repeated_x);
//             if zu || zv {
//                 break;
//             }
//         }
//         offset -= 2;
//     }

//     text[..offset].iter().rposition(|elt| {
//         (*elt & 0xFF) as u8 == x
//             || ((*elt >> 8) & 0xFF) as u8 == x
//             || ((*elt >> 16) & 0xFF) as u8 == x
//             || ((*elt >> 24) & 0xFF) as u8 == x
//     })
// }
