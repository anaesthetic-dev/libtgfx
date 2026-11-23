# libtgfx

Prebuilt [TGFX](https://github.com/Tencent/tgfx) with ANGLE for Windows x64 (MSVC). The ZIP contains `lib/tgfx.lib`, the public headers in `include/`, and the license.

GitHub Actions builds, tests, and publishes the ZIP every Monday, on pushes to `main`, and on manual runs from `main`. Each build uses the latest commit on Tencent/tgfx's `main` branch. Releases are named after the version declared in that commit and its hash. Rebuilding the same revision replaces the ZIP in that release.
