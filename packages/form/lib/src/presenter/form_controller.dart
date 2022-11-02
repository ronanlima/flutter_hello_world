import 'package:form/src/domain/usecases/login/login_usecase.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';

class FormController {
  final LoginUsecase _loginUsecase;

  FormController(this._loginUsecase);

  String email = '';
  String password = '';
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
    password = value;
  }

  Future<bool> login() async {
    final canLogin = emailError == null &&
        senhaError == null &&
        email.isNotEmpty &&
        password.isNotEmpty;
    if (!canLogin) return false;
    final result = await _loginUsecase.call(LoginParams(email: this.email, password: this.password));
    return result.fold<bool>((left) => false, (right) => true);
  }
}
