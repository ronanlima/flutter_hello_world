import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form/src/domain/repositories/login_repository.dart';
import 'package:form/src/domain/usecases/login/login_usecase.dart';
import 'package:form/src/domain/usecases/login/login_usecase_impl.dart';
import 'package:form/src/external/datasources/mock/login_datasource_mock_impl.dart';
import 'package:form/src/infra/datasources/login_datasource.dart';
import 'package:form/src/infra/repositories/login_repository_impl.dart';
import 'package:form/src/presenter/form_controller.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late FormController formController;
  late LoginDatasource _loginDatasource;
  late LoginRepository _loginRepository;
  late LoginUsecase _loginUsecase;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _loginDatasource = LoginDatasourceMockImpl();
    _loginRepository = LoginRepositoryImpl(_loginDatasource);
    _loginUsecase = LoginUsecaseImpl(_loginRepository);
    formController = FormController(_loginUsecase);
  }

  void showIsLoggedSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Form Page')),
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxWidth: 500),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatefulBuilder(builder: (context, setState) {
              return TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Ex.: email@provedor.com',
                  label: const Text('E-mail'),
                  errorText: formController.emailError,
                  // suffix: Icon(Icons.remove_red_eye)
                ),
                onChanged: (value) => setState(() {
                  formController.onChangedEmail(value);
                }),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            StatefulBuilder(builder: (context, setState) {
              return TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Senha',
                    label: const Text('Senha'),
                    errorText: formController.senhaError,
                    suffix: Icon(Icons.remove_red_eye)),
                onChanged: (value) =>
                    setState(() => formController.onChangedSenha(value)),
                obscureText: true,
              );
            }),
            const SizedBox(height: 20),
            // ElevatedButton(
            //     onPressed: () => login(context),
            //     child: const Text('Login')
            // ),
            StatefulBuilder(builder: (context, setState) {
              return isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            max(size.width * 0.1, 150),
                            max(size.width * 0.02, 60))),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final isLogged = await formController.login();
                        setState(() {
                          isLoading = false;
                        });
                        if (isLogged) {
                          showIsLoggedSnackBar('Logado com sucesso + Clean Dart');
                        } else {
                          showIsLoggedSnackBar('Não foi possível logar + Clean Dart');
                        }
                      },
                      child: const Text('Login'));
              // Container(
              //   child: ElevatedButton(
              //       style: ButtonStyle(
              //         maximumSize: MaterialStateProperty.all(
              //           Size(max(size.width * 0.1, 120), max(size.width * 0.02, 80))
              //         ),
              //         minimumSize: MaterialStateProperty.all(
              //           const Size(150, 80)
              //         )
              //       ),
              //       onPressed: () => login(context), child: const Text('Login')),
              // ),
              // TextButton(onPressed: () => login(context), child: const Text('Login')),
              // OutlinedButton(onPressed: () => login(context), child: const Text('Login')),
            }),
          ],
        ),
      ),
      // body: Container(
      //   constraints: BoxConstraints(maxWidth: 500),
      //   margin: const EdgeInsets.symmetric(horizontal: 50),
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: const [
      //         TextField(
      //           decoration: InputDecoration(border: OutlineInputBorder()),
      //         )
      //       ]),
      // ),
    );
  }
}
