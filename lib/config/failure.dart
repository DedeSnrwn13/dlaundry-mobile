abstract class Failure implements Exception {
  final String? message;

  Failure({required this.message});
}

class FetchFailure extends Failure {
  FetchFailure({required super.message});
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required super.message});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message});
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({required super.message});
}

class InvalidFailure extends Failure {
  InvalidFailure({required super.message});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
