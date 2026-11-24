# libtgfx

Prebuilt [TGFX](https://github.com/Tencent/tgfx) for Windows x64 (MSVC /MD) with [static ANGLE](https://github.com/anaesthetic-dev/libangle) bundled into `lib/tgfx.lib`. The ZIP includes the public headers and licenses. See `ANGLE-BUILD-INFO.txt` for the Windows SDK libraries to link.

GitHub Actions builds, tests, and publishes the ZIP every Monday, on pushes to `main`, and on manual runs from `main`. Each build uses the latest commit on Tencent/tgfx's `main` branch. Releases are named after the version declared in that commit and its hash. Rebuilding the same revision replaces the ZIP in that release.
