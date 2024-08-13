# README for LuaJIT 2.1

LuaJIT is a Just-In-Time (JIT) compiler for the Lua programming language.

Project Homepage: https://luajit.org/

LuaJIT is Copyright (C) 2005-2023 Mike Pall.
LuaJIT is free software, released under the MIT license.
See full Copyright Notice in the COPYRIGHT file or in luajit.h.

Documentation for LuaJIT is available in HTML format.
Please point your favorite browser to:

**doc/luajit.html**

# Heatblur

This is a mirror of the official LuaJIT repository, including Heatblur specific
modifications for our modules in the branch `windows_unicode`.

## Modifications

LuaJIT, by default, does not support loading Lua-files from Unicode paths, such
as

```lua
local file = require('你好')
```

or also when `package.path` contains base paths like `C:/Users/你好/SavedGames`.

LuaJIT relies on the platforms default encoding. For Windows, this happens to
not support UTF-8 or similar. The underlying C-code behind `require` can be
found around `src/lib_io.c`, `src/lib_package.c` and `src/li_load.c`, which are
based on using `fopen`.

We _fix_ the issue by using the platform specific `_wfopen` variant instead.
Going platform dependent is okay for us, since we only target Windows anyways.

## Building and Installing

Follow the instructions in `doc/install.html` (also see [online version](http://luajit.org/install.html)).

It consists of opening the repository folder in **x86_x64 Cross Tools Command Prompt for VS 2022**:

![Prompt](https://i.imgur.com/veM8bZA.png)

Navigating into the `src` subfolder and executing the `msvcbuild` bat.

The script generates a bunch of files that have to be copied into the module repositories (e.g. **anvil**).

Copy:

* all `lua` files from `LuaJIT/src/jit` to `anvil/ext/luajit/bin/lua/jit`
* all `lib`, `dll` and `exe` files from `LuaJIT/src` to `anvil/ext/luajit/bin`
* all `h` and `hpp` files from `LuaJIT/src` to `anvil/ext/luajit/include`
