#include <caml/alloc.h>
#include <caml/custom.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

#include <sys/ioctl.h>

CAMLprim value caml_ioctl_winsz_rows(value unit) {
  CAMLparam1(unit);

  struct winsize sz;
  ioctl(0, TIOCGWINSZ, &sz);
  CAMLreturn(Int_val(sz.ws_row));
}

CAMLprim value caml_ioctl_winsz_cols(value unit) {
  CAMLparam1(unit);

  struct winsize sz;
  ioctl(0, TIOCGWINSZ, &sz);
  CAMLreturn(Int_val(sz.ws_col));
}

CAMLprim value caml_ioctl_winsz_xpixels(value unit) {
  CAMLparam1(unit);

  struct winsize sz;
  ioctl(0, TIOCGWINSZ, &sz);
  CAMLreturn(Int_val(sz.ws_xpixel));
}

CAMLprim value caml_ioctl_winsz_ypixels(value unit) {
  CAMLparam1(unit);

  struct winsize sz;
  ioctl(0, TIOCGWINSZ, &sz);
  CAMLreturn(Int_val(sz.ws_ypixel));
}
