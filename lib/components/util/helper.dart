// matching various patterns for kinds of data

class Validator {
  Validator();

  String? notEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Data tidak boleh kosong';
    } else {
      return null;
    }
  }
}
