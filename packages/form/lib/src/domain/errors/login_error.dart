class LoginError {
  final String message;

  const LoginError({required this.message});

  @override
  String toString() => message;
}

class LoginUnkownError extends LoginError {
  const LoginUnkownError({required super.message});
}
