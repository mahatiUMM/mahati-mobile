class CapUtils {
  String capSizeToString(int capSize) {
    switch (capSize) {
      case 1:
        return "Terbatas";
      case 2:
        return "Bebas";
      case 3:
        return "Keras";
      default:
        return 'Unknown';
    }
  }
}
