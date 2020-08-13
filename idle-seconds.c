#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/extensions/scrnsaver.h>

/* gcc idle-seconds.c -o idle-seconds -lX11 -lXext -lXss */

int main(int argc, char *argv[])
{
  XScreenSaverInfo info;
  int event_base, error_base;

  Display *display = XOpenDisplay("");

  if (XScreenSaverQueryExtension(display, &event_base, &error_base)) {
    XScreenSaverQueryInfo(display, DefaultRootWindow(display), &info);
    printf("%d\n", (int) info.idle/1000);
    return(0);
  } else {
    fprintf(stderr, "Error: XScreenSaver Extension not present\n");
    return(1);
  }
}
