###Win7Go

A working go 1.23 compiler for Windows 7 (32 bit/386).

##Background

As we all know, Golang team dropped the support for Windows 7 since Go 1.21. This decision is up to the developers and given Win7 is past EOL, it has solid reasoning. However some people cannot buy a fancy PC that'll support a modern OS; others don't upgrade for a different reason, so this is how the project is born.

##Project state

This project is eternally in the pre-alpha, 'works on my machine' state because the (simple) idea behind it is all about reverting some commits that prevent Go from running on Windows 7, which obviously means no one can guarantee it works correctly (or works at all), can produce a working code that behaves as you expect or provide any security. When I state it works it means it does on my dev box, for my use cases, at the time I built it.
It is being tested on Windows 7 Ultimate edition SP1 32 bit (Version `6.1.7601`) with only few selected updates applied (their number is limited so the system could be considered almost clean). For testing cgo I use:
```shell
gcc version 14.2.0 (MinGW-W64 i686-msvcrt-posix-dwarf, built by Brecht Sanders, r2)
```
The toolchain/compiler can compile itself and works for my pet projects. Cross-compilation also works, at least for Linux/amd64 target (cgo untested).

##Where we are

On commit `ad87d4404782d816f7a4497113b6b983b45aa442`. Moving forward doesn't help much, since the number of reverted commits form a snowball effect that prevents merging almost any change or makes it useless. The approach of this repo is not very smart, it would be better to write patches that would actually handle functions unsupported by Win7 instead of simply reverting them, but I lack time and expertise to implement this.

It does not pass tests, but neither does unmodified official go git repo when compiled (I believe), so I removed them from `run.bat` for the better good and to save some time.

This is a working go tree, ready to `git clone` and then point `GOROOT` to.