class AppException implements Exception {
  final dynamic message;
  final dynamic prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, ''); // timeout
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Invalid Request '); // url doesnot exist
}

class UnauthroisedException extends AppException {
  UnauthroisedException([String? message])
      : super(message,
            'Unauthorised Request '); // session authroization inccorect
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message,
            'Unauthorised Request '); // session authroization inccorect
}
