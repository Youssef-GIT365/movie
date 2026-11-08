import 'package:movie/core/errors/error_message.dart';

class serverexception implements Exception {
  final ErrorMessage errorMessage;

  serverexception({required this.errorMessage});
}
