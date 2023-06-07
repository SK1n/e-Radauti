import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';

class AuthFirebaseResult {
  final bool isSuccess;
  final AuthFailureOrSuccess authFailureOrSuccess;

  AuthFirebaseResult({
    required this.authFailureOrSuccess,
    required this.isSuccess,
  });
}
