import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signUpWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  
  Future<void> signOut();
  String? get currentUserId;
  bool get isUserLoggedIn;
}
