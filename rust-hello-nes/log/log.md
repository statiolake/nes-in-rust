## 最初のコンパイル

```
$ make CC=cl65 -f minicargo.mk
--- BUILDING core v0.0.0 (0.0% 1r,0w,12b,0c/13t)
> /workspace/mrustc-master/bin/mrustc /workspace/mrustc-master/rustc-1.29.0-src/src/libcore/lib.rs -o output/libcore.rlib -C emit-depfile=output/libcore.rlib.d --cfg debug_assertions -O -L output --crate-name core --crate-type rlib --crate-tag 0_0_0 > output/libcore.rlib_dbg.txt
 (0.0% 1r,0w,12b,0c/13t): core v0.0.0
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1947-1948 warn:0:Unexpected attribute rustc_on_unimplemented on impl
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1960-1961 warn:0:Unexpected attribute rustc_on_unimplemented on impl
cl65: Don't know what to do with '"-ffunction-sections" "-pthread" "-Wno-psabi" "-O1" "-fno-tree-sra" "-fPIC" "-o" "output/libcore.rlib.o" "output/libcore.rlib.c" "-c"'
C Compiler failed to execute - error code 256
Process exited with non-zero exit status 1
FAILING COMMAND: /workspace/mrustc-master/bin/mrustc /workspace/mrustc-master/rustc-1.29.0-src/src/libcore/lib.rs -o output/libcore.rlib -C emit-depfile=output/libcore.rlib.d --cfg debug_assertions -O -L output --crate-name core --crate-type rlib --crate-tag 0_0_0
Env:  OUT_DIR=/workspace/mrustc-master/output/build_core CARGO_MANIFEST_DIR=/workspace/mrustc-master/rustc-1.29.0-src/src/libcore CARGO_PKG_NAME=core CARGO_PKG_VERSION=0.0.0 CARGO_PKG_VERSION_MAJOR=0 CARGO_PKG_VERSION_MINOR=0 CARGO_PKG_VERSION_PATCH=0
 (7.7% 0r,0w,12b,1c/13t):
BUILD FAILED
make: *** [minicargo.mk:242: LIBS] Error 1
```

そもそも `cl65 @flags.txt` の形式がサポートされてるんだかされてないんだか怪しい (ダブルクオートのせいかもしれないがうまく動いていない)

## cl65-wrapper ラッパーを作成

`cl65-wrapper` スクリプトを作成して `cl65` のラッパーにする

- @flags.txt を展開する
- 理解できないフラグ (-pthread とか -fPIC とか) を削除する

## 最初のコンパイル

libcore (28 万行の C コード) のコンパイルが最低限できないといけない。
が、cc65 がいろいろサポートしていないのでいろいろ削る必要がある。

最初のコンパイル。厳しい...

```
--- BUILDING core v0.0.0 (0.0% 1r,0w,12b,0c/13t)
> /workspace/mrustc-master/bin/mrustc /workspace/mrustc-master/rustc-1.29.0-src/src/libcore/lib.rs -o output/libcore.rlib -C emit-depfile=output/libcore.rlib.d --cfg debug_assertions -O -L output --crate-name core --crate-type rlib --crate-tag 0_0_0 > output/libcore.rlib_dbg.txt
 (0.0% 1r,0w,12b,0c/13t): core v0.0.0
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1947-1948 warn:0:Unexpected attribute rustc_on_unimplemented on impl
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1960-1961 warn:0:Unexpected attribute rustc_on_unimplemented on impl
output/libcore.rlib.c(9): Error: Include file 'stdatomic.h' not found
output/libcore.rlib.c(12): Error: Include file 'math.h' not found
output/libcore.rlib.c(22): Error: Identifier expected
output/libcore.rlib.c(22): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(22): Error: ';' expected
output/libcore.rlib.c(26): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(26): Error: ';' expected
output/libcore.rlib.c(27): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(27): Error: ';' expected
output/libcore.rlib.c(28): Error: Identifier expected
output/libcore.rlib.c(28): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(28): Error: ';' expected
output/libcore.rlib.c(28): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(28): Error: ';' expected
output/libcore.rlib.c(28): Warning: Implicit 'int' is an obsolete feature
output/libcore.rlib.c(28): Error: ')' expected
output/libcore.rlib.c(28): Warning: Implicit 'int' return type is an obsolete feature
output/libcore.rlib.c(28): Error: '{' expected
output/libcore.rlib.c(28): Fatal: Too many errors
C Compiler failed to execute - error code 256
```

## ガチャガチャいろんなことをやる

生成されたソースコードが新しすぎたり GNU 拡張に依存していたりするので、codegen から手を入れる必要がある。

### インクルードヘッダーと固定テンプレートの削減

- `#include <stdatomic.h>` を削除
- `#include <math.h>` を削除
  - そもそも cc65 には浮動小数点数もないため...
- 64 / 128 ビット整数値に対する固定のヘルパー関数を削除

### 基本データ型の変更

- size_t を削除して int に置き換える
- float, double を int に読み替える (!!)
  - なかなかアグレッシブだが浮動小数点数をサポートしていないため...
- (u)int64_t, (u)int128_t を int に読み替える
  - それに伴い ull サフィックスの変更も

### 言語機能の対応

- inline の削除
- \_\_thread の削除
- 初期化子の制約に対応
  ```
  SLICE_PTR rv = { ptr, s };
  ```
  のようなことができないらしいので (初期化子は定数しかダメらしい)
  ```
  SLICE_PTR rv; rv.PTR = ptr; rv.META = s;
  ```
  に置き換え
- よくわからないプロトタイプ宣言の削除
  - struct のプロトタイプ宣言と struct の定義が重複扱いになったのでプロトタイプ宣言を削除
- Designated Initializers ({ .raw = ... } みたいにメンバを指定して初期化する構文) の解消
  - 場合によっては union の順序入れ替えなども実施してなんとかごまかす
- アトミック操作の削除
- 属性の削除 (`__attribute__((...))`)
- ゼロサイズ配列の削除 (DATA[0] の配列を最低 DATA[1] などに変更)
  - それで壊れたら？ しらない
- typedef char static_assert[cond ? 1 : -1]; のようなイディオムを削除
- 配列の最大長の制限
  - 一律問答無用に 128 とかに制限
  - それで壊れたら？ しらない
- ネームマングリングの最大長の制限 (128 文字 → 48 文字)
- 長いシンボル名のハッシュ区切り文字の変更 (`$` → `_`)
- 構造体を返す関数を、戻り値ではなくポインタ渡しで返すように変更
  - cc65 は一定サイズ以上の構造体を値で返せない？ ため
- 外部リンケージの構文 asm(linkage_name) の削除
  - 詳しくなさ過ぎてまったくよくわからないが以下のような使われ方をしているらしい
    - 外部から呼び出すとき: linkage_name で指定された名前でリンクする
    - 内部で呼び出すとき: ネームマングリングされた名前で呼び出す
  - そのため、とりあえず linkage_name で extern 宣言を生成しておき、内部から呼び出すとき用に別途ネームマングリングされたラッパー関数を生成することでエミュレート
- xgetbv の削除
  - 何に使うかわからず、しかしアセンブリ命令を生成しているので削除

## ここまでやった後の様子

libcore.rlib.c が 5 万行くらいコンパイルできるようになった (全体の 28 万行に対し)

```
--- BUILDING core v0.0.0 (0.0% 1r,0w,12b,0c/13t)
> /workspace/mrustc-master/bin/mrustc /workspace/mrustc-master/rustc-1.29.0-src/src/libcore/lib.rs -o output/libcore.rlib -C emit-depfile=output/libcore.rlib.d --cfg debug_assertions -O -L output --crate-name core --crate-type rlib --crate-tag 0_0_0 > output/libcore.rlib_dbg.txt
 (0.0% 1r,0w,12b,0c/13t): core v0.0.0
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1947-1948 warn:0:Unexpected attribute rustc_on_unimplemented on impl
/workspace/mrustc-master/rustc-1.29.0-src/src/libcore/slice/mod.rs:1960-1961 warn:0:Unexpected attribute rustc_on_unimplemented on impl
output/libcore.rlib.c(32): Warning: Passing struct by value for parameter 'l'
output/libcore.rlib.c(32): Warning: Passing struct by value for parameter 'r'
output/libcore.rlib.c(43): Warning: Parameter 'p' is never used
output/libcore.rlib.c(45): Warning: Passing struct by value for parameter 'val'
output/libcore.rlib.c(372): Warning: Passing struct by value for parameter '$anon-param-001B'
output/libcore.rlib.c(374): Warning: Passing struct by value for parameter '$anon-param-0021'
output/libcore.rlib.c(5674): Warning: Passing struct by value for parameter '$anon-param-00CE'
output/libcore.rlib.c(7382): Error: Illegal attribute: 'weak'
output/libcore.rlib.c(7383): Error: Illegal attribute: 'weak'
output/libcore.rlib.c(60240): Warning: Passing struct by value for parameter 'arg1'

... 中略...

output/libcore.rlib.c(60434): Warning: 'bb3' is defined but never used
output/libcore.rlib.c(60437): Warning: Passing struct by value for parameter 'arg0'
output/libcore.rlib.c(60547): Error: Too many local variables
output/libcore.rlib.c(60547): Error: Too many local variables
output/libcore.rlib.c(60548): Error: Too many local variables
output/libcore.rlib.c(60551): Error: Too many local variables
output/libcore.rlib.c(60552): Error: Expression expected
output/libcore.rlib.c(60553): Error: Too many local variables
output/libcore.rlib.c(60553): Error: ';' expected
output/libcore.rlib.c(60553): Error: Too many local variables
output/libcore.rlib.c(60553): Error: Too many local variables
output/libcore.rlib.c(60553): Fatal: Too many errors
C Compiler failed to execute - error code 256
```

大量の warning は置いておくとして、問題は too many local variables
まあ確かに 105 個とかローカル変数がある関数が生成されており...
(core::hash 配下のコンパイル時。確かにハッシュは計算のためにいろいろ領域が必要そう...)
6502 のスタックに収まらないのも頷けるので、こればかりはさすがにどう回避しても無理だろうという結論に至る

結論: 6502 には core ですらでかすぎる

## 自前で core を実装したらいいのでは？

最小限の core を自前で実装しよう。

```
#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![no_core]

#[lang = "sized"]
trait Sized {}

pub mod ops {
    pub struct RangeFull;
}

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
```

なんかこれくらい書いたら最低限 OK らしい

これに対して main.rs を次のように書き、コンパイルすると...

```
#![allow(internal_features)]
#![feature(lang_items, no_core)]
#![feature(start)]
#![no_core]
#![no_main]

extern "C" {
    #[no_mangle]
    fn gotoxy(x: u8, y: u8);

    #[no_mangle]
    fn cprintf(fmt: *const u8, ...);
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    unsafe {
        gotoxy(10, 10);
        cprintf(b"Hello, world from Rust!\0" as *const u8);
    }

    loop {}
}
```

```
CC=../mrustc-master/cl65-wrapper ../mrustc-master/bin/minicargo --output-dir output ./main
--- BUILDING main v0.1.0 [bin main] (50.0% 1r,0w,0b,1c/2t)
> /workspace/mrustc-master/bin/mrustc /workspace/rust-hello-nes/main/src/main.rs -o output/main -C emit-depfile=output/main.d --cfg debug_assertions -O -L output --crate-name main --crate-type bin --crate-tag 0_1_0 --extern core=output/libcore-0_1_0.rlib > output/main_dbg.txt
 (50.0% 1r,0w,0b,1c/2t): main v0.1.0 [bin main]
output/main.c(32): Warning: Passing struct by value for parameter 'l'
output/main.c(32): Warning: Passing struct by value for parameter 'r'
output/main.c(43): Warning: Parameter 'p' is never used
output/main.c(45): Warning: Passing struct by value for parameter 'val'
output/main.c(126): Warning: Parameter 'arg0' is never used
output/main.c(126): Warning: Parameter 'arg1' is never used
output/main.c(126): Warning: 'rv' is defined but never used
output/main.c(126): Warning: 'bb3' is defined but never used
output/main.c(149): Warning: Passing struct by value for parameter 'l'
output/main.c(149): Warning: Passing struct by value for parameter 'l'
output/main.c(150): Warning: 'ALIGN_TO' is defined but never used
output/main.c(150): Warning: 'make_sliceptr' is defined but never used
output/main.c(150): Warning: 'make_traitobjptr' is defined but never used
output/main.c(150): Warning: 'mrustc_max' is defined but never used
output/main.c(150): Warning: 'noop_drop' is defined but never used
output/main.c(150): Warning: 'mrustc_string_search_linear' is defined but never used
output/main.c(150): Warning: '__mrustc_bitrev32' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umax8' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umin8' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imax8' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imin8' is defined but never used
output/main.c(150): Warning: '__mrustc_op_and_not8' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umax16' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umin16' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imax16' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imin16' is defined but never used
output/main.c(150): Warning: '__mrustc_op_and_not16' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umax32' is defined but never used
output/main.c(150): Warning: '__mrustc_op_umin32' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imax32' is defined but never used
output/main.c(150): Warning: '__mrustc_op_imin32' is defined but never used
output/main.c(150): Warning: '__mrustc_op_and_not32' is defined but never used
Completed main v0.1.0 [bin main]
 (100.0% 0r,0w,0b,2c/2t):
```

おおコンパイル成功！

#![screenshots/01_first_success.png]

## ちょっと複雑目なコードを書いてみる

```
... 略 ...

fn fizz_buzz(n: u8) {
    for i in 1..=n {
        match (i % 3, i % 5) {
            (0, 0) => unsafe { cprintf(b"FizzBuzz\n\0" as *const u8) },
            (0, _) => unsafe { cprintf(b"Fizz\n\0" as *const u8) },
            (_, 0) => unsafe { cprintf(b"Buzz\n\0" as *const u8) },
            _ => unsafe { cprintf(b"%d\n\0" as *const u8, i) },
        }
    }
}

#[start]
fn start(_argc: isize, _argv: *const *const u8) -> isize {
    fizz_buzz(20);

    loop {}
}

```

しかしエラーが出る

```
<null> error:0:Couldn't find path component 'iter' of ::"core-0_1_0"::iter::IntoIterator/*?*/
```

core がないので当然ですね...
重たい hash とかそういう特殊なものを除けば案外使えるのでは？という気もするので、ちょっとずつ core を移植してみる
