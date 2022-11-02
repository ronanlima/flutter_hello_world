import 'package:form/src/domain/typedefs/login_result.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';

abstract class LoginDatasource {
  LoginResult call(LoginParams params);
}
