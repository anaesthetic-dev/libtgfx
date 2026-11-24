#include <tgfx/core/Bitmap.h>
#include <tgfx/gpu/opengl/egl/EGLDevice.h>

int main() {
  tgfx::Bitmap bitmap(4, 3, false, false);
  auto device = tgfx::EGLDevice::MakeFrom(EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT);
  return bitmap.width() == 4 && bitmap.height() == 3 && !device &&
                 eglGetCurrentContext() == EGL_NO_CONTEXT
             ? 0
             : 1;
}
