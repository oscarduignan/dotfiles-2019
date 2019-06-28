self: super:
{
  polybar = super.polybar.override {
    i3Support = true;
    alsaSupport = true;
    pulseSupport = true;
  };
}
