import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final globalKey = GlobalKey<_StatefulWidgetWithGlobalKeyState>();

class StatefulWidgetWithGlobalKey extends StatefulWidget {
  const StatefulWidgetWithGlobalKey({super.key});

  @override
  State<StatefulWidgetWithGlobalKey> createState() =>
      _StatefulWidgetWithGlobalKeyState();
}

class _StatefulWidgetWithGlobalKeyState
    extends State<StatefulWidgetWithGlobalKey> {
  int _counter = 0;

  @override
  void initState() {
    debugPrint("--- INITSTATE ---");
    super.initState();
  }

  @override
  void activate() {
    debugPrint("--- ACTIVATE ---");
    super.activate();
  }

  @override
  void didChangeDependencies() {
    debugPrint("--- DIDCHANGEDEPENDENCIES ---");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    debugPrint("--- DEACTIVATE ---");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("--- DISPOSE ---");
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Stateful widget with global key"),
        Text(_counter.toString()),
        ElevatedButton(onPressed: _increment, child: const Text("increment")),
      ],
    );
  }
}
