import 'package:dependencies/dependencies.dart';
import 'package:form/src/domain/errors/login_error.dart';
import 'package:form/src/domain/repositories/login_repository.dart';
import 'package:form/src/domain/typedefs/login_result.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';
import 'package:form/src/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDatasource _datasource;

  const LoginRepositoryImpl(this._datasource);

  @override
  LoginResult call(LoginParams params) async {
    try {
      final result = await _datasource.call(params);
      return result;
      // result.fold(
      //         (error) => null,
      //         (entity) => null
      // );
    } catch (e) {
      print(e);
      return Left(LoginUnkownError(message: 'Não foi possível logar'));
    }
  }
}
