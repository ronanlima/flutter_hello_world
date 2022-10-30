import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hello_world/features/home/widgets/stateful_widget_with_global_key.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            debugPrint("back button clicked");
            Navigator.pop(context);
          },
        ),
        title: Text("Second Page"),
      ),
      body: StatefulWidgetWithGlobalKey(
        key: globalKey,
      ),
    );
  }
}
