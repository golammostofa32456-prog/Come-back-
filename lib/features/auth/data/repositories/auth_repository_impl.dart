import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    // সাইনআউট লজিক
  }

  @override
  String? get currentUserId => remoteDataSource.supabaseClient.auth.currentUser?.id;

  @override
  bool get isUserLoggedIn => remoteDataSource.supabaseClient.auth.currentUser != null;
}
