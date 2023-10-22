extension StringExt on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }

  String getInitials(String fullName) => fullName.isNotEmpty
      ? fullName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
