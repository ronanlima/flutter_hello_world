import 'package:flutter/widgets.dart';

import '../../core.dart';

abstract class Feature extends StatelessWidget {
  Widget get child;

  Map<Type, Object> dependencies({DependencyInjectionWidget? injector});

  const Feature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final previousDependencyInjector = DependencyInjectionWidget.of(context);
    var previousInjectedDependencies = previousDependencyInjector?.dependencies;
    var previousDependencies =
        dependencies(injector: previousDependencyInjector);
    if (previousInjectedDependencies != null) {
      previousDependencies.addAll(previousInjectedDependencies);
    }
    return DependencyInjectionWidget(
        dependencies: previousDependencies, child: child);
  }
}
