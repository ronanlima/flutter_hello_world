import 'package:form/src/domain/repositories/login_repository.dart';
import 'package:form/src/domain/typedefs/login_result.dart';
import 'package:form/src/domain/usecases/login/login_usecase.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';

class LoginUsecaseImpl extends LoginUsecase {
  final LoginRepository _repository;

  const LoginUsecaseImpl(this._repository);

  @override
  LoginResult call(LoginParams params) {
    return _repository(params);
  }
}
