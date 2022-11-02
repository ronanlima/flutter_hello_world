import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form/src/presenter/form_controller.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final FormController formController;

  @override
  void initState() {
    super.initState();
    formController = FormController();
  }

  void showIsLoggedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logado com sucesso + formController')),
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
            TextField(
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Senha',
                  label: const Text('Senha'),
                  errorText: formController.senhaError,
                  suffix: Icon(Icons.remove_red_eye)),
              onChanged: (value) => setState(() => formController.onChangedSenha(value)),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //     onPressed: () => login(context),
            //     child: const Text('Login')
            // ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(
                      max(size.width * 0.1, 150), max(size.width * 0.02, 60))),
                ),
                onPressed: () {
                  final isLogged = formController.login();
                  if (isLogged) {
                    showIsLoggedSnackBar();
                  }
                } ,
                child: const Text('Login')),
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
