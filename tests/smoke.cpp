#include <tgfx/core/Bitmap.h>

int main() {
  tgfx::Bitmap bitmap(4, 3, false, false);
  return bitmap.width() == 4 && bitmap.height() == 3 ? 0 : 1;
}
