extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regExp = RegExp("");
    return regExp.hasMatch(this);
  }
}
