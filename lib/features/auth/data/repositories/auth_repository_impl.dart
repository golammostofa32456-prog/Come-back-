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
      // এখানে Failure এর জায়গায় ServerFailure ব্যবহার করা হয়েছে
      return Left(ServerFailure(e.toString()));
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
      // এখানেও ServerFailure ব্যবহার করা হয়েছে
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    // সাইনআউট লজিক
    await remoteDataSource.supabaseClient.auth.signOut();
  }

  @override
  String? get currentUserId => remoteDataSource.supabaseClient.auth.currentUser?.id;

  @override
  bool get isUserLoggedIn => remoteDataSource.supabaseClient.auth.currentUser != null;
}
