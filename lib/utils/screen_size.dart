/// The three layout types supported by the catalog.
enum ScreenType { mobile, tablet, desktop }

/// Breakpoints and layout values calculated from the available width.
///
/// The width comes from a [LayoutBuilder], so the values follow the space
/// the widget actually gets instead of the full device screen.
class ScreenSize {
  static const double tabletMin = 600;
  static const double desktopMin = 1024;

  /// Returns the layout type for the given width.
  static ScreenType fromWidth(double width) {
    if (width >= desktopMin) return ScreenType.desktop;
    if (width >= tabletMin) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  /// Returns the horizontal padding used around the content.
  static double sidePadding(ScreenType type) {
    switch (type) {
      case ScreenType.desktop:
        return 32;
      case ScreenType.tablet:
        return 24;
      case ScreenType.mobile:
        return 12;
    }
  }

  /// Returns how many grid columns fit in the given width.
  static int gridColumns(double width) {
    if (width >= 1200) return 5;
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }
}
