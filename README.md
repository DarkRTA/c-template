This is a small template for projects written in C. I plan on using this for
future projects that don't need something more complex like cmake.

### Dependencies

The only thing you really need to make use of this a working C compiler and 
GNU Make. Other versions of Make might work but are untested.

You will also need ctags installed to make use of `make tags`

### Usage

The best way to make use of this is to clone the repo then delete the `./.git`
folder to remove any and all commit history from this repo.

The `Makefile` is set up in such a way that all c source files under `./src`
and `./deps` are compiled for you. Edit the makefile to change compile and link
flags. Everything else should be pretty self evident.

`./deps` is used for libraries fetched with [clib](https://clibs.org). You may
also use this for other small source code only libraries. You can use include
files from there in a manner similar to other systemwide header files.

```c
//example assuming the header file is at ./deps/dir/file.h
#include <dir/file.h>

int main()
{
	func();
}
```

### Licensing info

Treat this as being in the public domain. Just don't hold me liable for
anything that goes wrong with it.
