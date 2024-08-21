@rem Script to build LuaJIT for MSFS with MSVC (minilua) and the MSFS SDK.
@rem
@rem Open a "Visual Studio Command Prompt" x86.
@rem Then cd to this directory and run this script.
@rem MSFS WASM uses 32-bit addressing. Remember to adjust to 8 byte pointers when/if WASM moves to 64-bit.

@if not defined INCLUDE goto :FAIL

@setlocal
@rem Add more debug flags here, e.g. DEBUGCFLAGS=/DLUA_USE_ASSERT
@set DEBUGCFLAGS=/D _DEBUG /Od
@set LJCOMPILE_MINILUA=cl /nologo /c /O2 /W3 /D_CRT_SECURE_NO_DEPRECATE /D LUAJIT_DISABLE_JIT /D_CRT_STDIO_INLINE=__declspec(dllexport)__inline
@REM @set LJCOMPILE="%MSFS_SDK%WASM/llvm/bin/clang-cl.exe" /I"%MSFS_SDK%WASM/wasi-sysroot/include" /I"%MSFS_SDK%WASM/wasi-sysroot/include/c++/v1" /I"%MSFS_SDK%WASM/include" /I"%MSFS_SDK%SimConnect SDK/include" /D LUAJIT_TARGET=LUAJIT_ARCH_X86 /D _MSFS_WASM /D _WASI_EMULATED_MMAN /D _STRING_H_CPLUSPLUS_98_CONFORMANCE_ /D _WCHAR_H_CPLUSPLUS_98_CONFORMANCE_ /D _LIBCPP_NO_EXCEPTIONS /D _MBCS /MDd /GS- /fp:precise /permissive- /c /nologo /diagnostics:column /Gd /TP /showFilenames /clang:-g /clang:-fstandalone-debug /clang:-mllvm /clang:-wasm-disable-redzone /clang:-fstack-size-section /clang:-mbulk-memory /clang:--sysroot="%MSFS_SDK%WASM/wasi-sysroot" /clang:-fvisibility=hidden /clang:-ffunction-sections /clang:-fdata-sections /clang:-fno-stack-protector /clang:-fno-exceptions /clang:-fms-extensions /clang:-fwritable-strings -m32 -fansi-escape-codes -fcolor-diagnostics --target=wasm32-unknown-wasi -Werror=return-type -Wno-unused-command-line-argument -Wno-unknown-pragmas -Wno-missing-field-initializers -Wno-sign-compare -Wno-deprecated-experimental-coroutine
@REM @set LJCOMPILE="%MSFS_SDK%WASM/llvm/bin/clang-cl.exe" /I"%MSFS_SDK%WASM/wasi-sysroot/include" /I"%MSFS_SDK%WASM/wasi-sysroot/include/c++/v1" /I"%MSFS_SDK%WASM/include" /I"%MSFS_SDK%SimConnect SDK/include" /D LUAJIT_TARGET=LUAJIT_ARCH_X86 /D LUAJIT_DISABLE_TEMP /D _WASI_EMULATED_MMAN /D LUAJIT_DISABLE_JIT /D LUAJIT_DISABLE_FFI /D LUAJIT_SECURITY_PRNG=0 /D _WASI_EMULATED_SIGNAL /D LUAJIT_DISABLE_PROFILE -m32 --target=wasm32-unknown-wasi
@REM @set LJCOMPILE="%MSFS_SDK%WASM/llvm/bin/clang-cl.exe" /I"%MSFS_SDK%WASM/wasi-sysroot/include" /I"%MSFS_SDK%WASM/wasi-sysroot/include/c++/v1" /I"%MSFS_SDK%WASM/include" /I"%MSFS_SDK%SimConnect SDK/include" /D LUAJIT_TARGET=LUAJIT_ARCH_X86 /D LUAJIT_DISABLE_TEMP /D _WASI_EMULATED_MMAN /D LUAJIT_DISABLE_JIT /D LUAJIT_DISABLE_FFI /D LUAJIT_SECURITY_PRNG=0 /D _WASI_EMULATED_SIGNAL /D LUAJIT_DISABLE_PROFILE /D _MSFS_WASM /D _STRING_H_CPLUSPLUS_98_CONFORMANCE_ /D _WCHAR_H_CPLUSPLUS_98_CONFORMANCE_ /D _LIBCPP_NO_EXCEPTIONS /D _MBCS /MDd /GS- /fp:precise /permissive- /c /nologo /diagnostics:column /Gd /TP /showFilenames /clang:-g /clang:-fstandalone-debug /clang:-mllvm /clang:-wasm-disable-redzone /clang:-fstack-size-section /clang:-mbulk-memory /clang:--sysroot="%MSFS_SDK%WASM/wasi-sysroot" /clang:-fvisibility=hidden /clang:-ffunction-sections /clang:-fdata-sections /clang:-fno-stack-protector /clang:-fno-exceptions /clang:-fms-extensions /clang:-fwritable-strings -m32 -fansi-escape-codes -fcolor-diagnostics --target=wasm32-unknown-wasi -Werror=return-type -Wno-unused-command-line-argument -Wno-unknown-pragmas -Wno-missing-field-initializers -Wno-sign-compare -Wno-deprecated-experimental-coroutine
@set LJCOMPILE="%MSFS_SDK%WASM/llvm/bin/clang-cl.exe" /I"%MSFS_SDK%WASM/wasi-sysroot/include" /I"%MSFS_SDK%WASM/wasi-sysroot/include/c++/v1" /I"%MSFS_SDK%WASM/include" /I"%MSFS_SDK%SimConnect SDK/include" /D LUAJIT_TARGET=LUAJIT_ARCH_X86 /D LUAJIT_DISABLE_TEMP /D _WASI_EMULATED_MMAN /D LUAJIT_DISABLE_JIT /D LUAJIT_SECURITY_PRNG=0 /D _WASI_EMULATED_SIGNAL /D _WASI_EMULATED_PROCESS_CLOCKS /D LUAJIT_DISABLE_PROFILE /D _MSFS_WASM /D _STRING_H_CPLUSPLUS_98_CONFORMANCE_ /D _WCHAR_H_CPLUSPLUS_98_CONFORMANCE_ /D _LIBCPP_NO_EXCEPTIONS /D _MBCS /MDd /GS- /fp:precise /permissive- /c /nologo /diagnostics:column /Gd /showFilenames /clang:-g /clang:-fstandalone-debug /clang:-mllvm /clang:-wasm-disable-redzone /clang:-fstack-size-section /clang:-mbulk-memory /clang:--sysroot="%MSFS_SDK%WASM/wasi-sysroot" /clang:-fvisibility=hidden /clang:-ffunction-sections /clang:-fdata-sections /clang:-fno-stack-protector /clang:-fno-exceptions /clang:-fms-extensions /clang:-fwritable-strings -m32 -fansi-escape-codes -fcolor-diagnostics --target=wasm32-unknown-wasi -Werror=return-type -Wno-unused-command-line-argument -Wno-unknown-pragmas -Wno-missing-field-initializers -Wno-sign-compare -Wno-deprecated-experimental-coroutine
@set RELEASECFLAGS=/D NDEBUG /O2 /Oi
@set DEBUGLJLINKFLAGS=/DEBUG /RELEASE
@set RELEASELJLINKFLAGS=/OPT:REF /OPT:ICF /INCREMENTAL:NO
@set LJLINK_MINILUA=link /nologo
@set LJMT_MINILUA=mt /nologo
@set LJLIB="%MSFS_SDK%/WASM/llvm/bin/llvm-ar.exe" qc
@set DASMDIR=..\dynasm
@set DASM=%DASMDIR%\dynasm.lua
@set DASC=vm_x64.dasc
@set LJLIBNAME=lua51.a
@set ALL_LIB=lib_base.c lib_math.c lib_bit.c lib_string.c lib_table.c lib_io.c lib_os.c lib_package.c lib_debug.c lib_jit.c lib_ffi.c lib_buffer.c

@setlocal
%LJCOMPILE_MINILUA% host\minilua.c
@if errorlevel 1 goto :BAD
%LJLINK_MINILUA% /out:minilua.exe minilua.obj
@if errorlevel 1 goto :BAD
if exist minilua.exe.manifest^
  %LJMT_MINILUA% -manifest minilua.exe.manifest -outputresource:minilua.exe
@endlocal

@minilua
@if errorlevel 8 goto :A64_DETECTED
@set DASC=vm_x86.dasc
@set DASMTARGET=-D LUAJIT_TARGET=LUAJIT_ARCH_X86
@REM @set DASMFLAGS=-D LUAJIT_OS=LUAJIT_OS_OTHER -D JIT -D FFI -D ENDIAN_LE -D FPU -D LUAJIT_ARCH_X86
@set DASMFLAGS=-D LUAJIT_OS=LUAJIT_OS_OTHER -D FFI -D ENDIAN_LE -D LUAJIT_ARCH_X86
@set LJARCH=x86
@goto :DA
:A64_DETECTED
@echo Incorrect pointer size detected. You must open a "Visual Studio Command Prompt (x86)" to run this script.
@goto :END
:DA
minilua %DASM% -LN %DASMFLAGS% -o host\buildvm_arch.h %DASC%
@if errorlevel 1 goto :BAD

if exist ..\.git ( git show -s --format=%ct >luajit_relver.txt ) else ( type ..\.relver >luajit_relver.txt )
minilua host\genversion.lua

@setlocal
%LJCOMPILE_MINILUA% /I "." /I %DASMDIR% %DASMTARGET% host\buildvm*.c
@if errorlevel 1 goto :BAD
%LJLINK_MINILUA% /out:buildvm.exe buildvm*.obj
@if errorlevel 1 goto :BAD
if exist buildvm.exe.manifest^
  %LJMT_MINILUA% -manifest buildvm.exe.manifest -outputresource:buildvm.exe
@endlocal

buildvm -m elfasm -o lj_vm.obj
@if errorlevel 1 goto :BAD
buildvm -m bcdef -o lj_bcdef.h %ALL_LIB%
@if errorlevel 1 goto :BAD
buildvm -m ffdef -o lj_ffdef.h %ALL_LIB%
@if errorlevel 1 goto :BAD
buildvm -m libdef -o lj_libdef.h %ALL_LIB%
@if errorlevel 1 goto :BAD
buildvm -m recdef -o lj_recdef.h %ALL_LIB%
@if errorlevel 1 goto :BAD
buildvm -m vmdef -o jit\vmdef.lua %ALL_LIB%
@if errorlevel 1 goto :BAD
buildvm -m folddef -o lj_folddef.h lj_opt_fold.c
@if errorlevel 1 goto :BAD

@if "%1" neq "debug" goto :NODEBUG
@shift
@set LJCOMPILE=%LJCOMPILE% %DEBUGCFLAGS%
@set LJLINK=%LJLINK% %DEBUGLJLINKFLAGS%
@goto :STATIC
:NODEBUG
@set LJCOMPILE=%LJCOMPILE% %RELEASECFLAGS%
@set LJLINK=%LJLINK% %RELEASELJLINKFLAGS%
:STATIC
@setlocal enabledelayedexpansion
@set COMPILE_FILE_LIST=
@for %%f in (lj_*.c lib_*.c) do @set COMPILE_FILE_LIST=!COMPILE_FILE_LIST! %%f
%LJCOMPILE% %COMPILE_FILE_LIST%
@endlocal
@if errorlevel 1 goto :BAD
%LJLIB% %LJLIBNAME% lj_*.obj lib_*.obj
@if errorlevel 1 goto :BAD

@del *.obj *.manifest minilua.exe buildvm.exe
@del host\buildvm_arch.h
@del lj_bcdef.h lj_ffdef.h lj_libdef.h lj_recdef.h lj_folddef.h
@echo.
@echo === Successfully built LuaJIT for MSFS WASM ===

@goto :END

:BAD
@echo.
@echo *******************************************************
@echo *** Build FAILED -- Please check the error messages ***
@echo *******************************************************
@goto :END
:FAIL
@echo You must open a "Visual Studio Command Prompt (x86)" to run this script
:END
