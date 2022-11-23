abstract class DependencyInjectionErro {
  const DependencyInjectionErro();
}

class DependencyNotFound<T> extends DependencyInjectionErro {
  const DependencyNotFound();

  @override
  String toString() => "$T type dependency hasn't been found";
}