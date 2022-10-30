import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String email = '';
  String senha = '';
  String? emailError;
  String? senhaError;

  void onChangedEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        emailError = 'Digite um e-mail';
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
    email = value;
  }

  void onChangedSenha(String value) {
    if (value.isEmpty) {
      setState(() {
        senhaError = 'Digite uma senha';
      });
    } else {
      setState(() {
        senhaError = null;
      });
    }
    senha = value;
  }

  void login(BuildContext context) {
    if (emailError != null ||
        senhaError != null ||
        email.isEmpty ||
        senha.isEmpty) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logado com sucesso')),
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
                errorText: emailError,
                // suffix: Icon(Icons.remove_red_eye)
              ),
              onChanged: onChangedEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Senha',
                  label: const Text('Senha'),
                  errorText: senhaError,
                  suffix: Icon(Icons.remove_red_eye)),
              onChanged: onChangedSenha,
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
                onPressed: () => login(context),
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
