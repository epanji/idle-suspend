#include <stdio.h>
#include <X11/extensions/scrnsaver.h>

/* gcc idle-seconds.c -o idle-seconds -lX11 -lXext -lXss */

int main()
{
  Display *display = XOpenDisplay(NULL);
  if (display) {
    XScreenSaverInfo info;
    XScreenSaverQueryInfo(display, DefaultRootWindow(display), &info);
    printf("%d\n", (int) info.idle/1000);
    return(0);
  } else {
    fprintf(stderr, "Display not found\n");
    return(1);
  }
}
