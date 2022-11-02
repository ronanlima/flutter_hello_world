import 'package:dependencies/dependencies.dart';
import 'package:form/src/domain/entities/login_entity.dart';
import 'package:form/src/domain/typedefs/login_result.dart';
import 'package:form/src/domain/usecases/params/login_params.dart';
import 'package:form/src/infra/datasources/login_datasource.dart';

class LoginDatasourceMockImpl extends LoginDatasource {
  @override
  LoginResult call(LoginParams params) async {
    await Future.delayed(const Duration(seconds: 3));
    return const Right(LoginEntity(id: '123', username: 'Ronan'));
  }
}
