import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Supabase Client
  // টাইপ ডিফাইন করে দেওয়া ভালো, যাতে GetIt বুঝতে পারে
  if (!sl.isRegistered<SupabaseClient>()) {
    sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  // Auth Remote Data Source
  // এরর ফিক্স: supabaseClient: বাদ দিয়ে সরাসরি sl() পাস করা হয়েছে (Positional)
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Auth Repository
  // এরর ফিক্স: authRemoteDataSource: বাদ দিয়ে সরাসরি sl() পাস করা হয়েছে (Positional)
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()), 
  );

  // Auth BLoC
  sl.registerFactory(
    () => AuthBloc(authRepository: sl()), // এটি ঠিক আছে, যদি AuthBloc-এ named param থাকে
  );
}
