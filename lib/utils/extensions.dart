extension Validators on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPasswordLength() {
    return RegExp(r'^.{8,64}$').hasMatch(this);
  }

  bool hasLowercaseAndUppercase() {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).*$').hasMatch(this);
  }

  bool hasDigit() {
    return RegExp(r'^.*(?=.*\d).*$').hasMatch(this);
  }
}
