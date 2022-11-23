import 'package:flutter/widgets.dart';

import '../../core.dart';

abstract class Feature extends StatelessWidget {
  Widget get child;
  Map<Type, Object> get dependencies;

  const Feature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependencyInjectionWidget(
      dependencies: dependencies,
      child: child
    );
  }
}
