import 'package:form/src/domain/typedefs/login_result.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';

abstract class LoginRepository {
  LoginResult call(LoginParams params);

  const LoginRepository();
}
