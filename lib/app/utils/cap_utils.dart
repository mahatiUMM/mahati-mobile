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

  int capSizeFromString(String capSize) {
    switch (capSize) {
      case "Obat Terbatas":
        return 1;
      case "Obat Bebas":
        return 2;
      case "Obat Keras":
        return 3;
      default:
        throw ArgumentError("Unknown capsule size: $capSize");
    }
  }
}
