class FormController {
  String email = '';
  String senha = '';
  String? emailError;
  String? senhaError;

  void onChangedEmail(String value) {
    if (value.isEmpty) {
      emailError = 'Digite um e-mail';
    } else {
      emailError = null;
    }
    email = value;
  }

  void onChangedSenha(String value) {
    if (value.isEmpty) {
      senhaError = 'Digite uma senha';
    } else {
      senhaError = null;
    }
    senha = value;
  }

  bool login() {
    return (emailError == null &&
        senhaError == null &&
        email.isNotEmpty &&
        senha.isNotEmpty);
  }
}