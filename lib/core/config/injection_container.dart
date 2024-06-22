import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:scholariship/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scholariship/features/auth/data/repository/auth_repository_impl.dart';
import 'package:scholariship/features/auth/domain/repository/auth_repository.dart';
import 'package:scholariship/features/auth/presentation/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init()async {


  //! Feature - Auth
  // Bloc
  sl.registerFactory(
      ()=> AuthBloc(sl())
  );

  // UseCases


  // Repository
  sl.registerLazySingleton<AuthRepository>(
      ()=> AuthRepositoryImpl(client:sl(),remoteDataSource: sl(), sharedPreferences: sl())
  );


  
  // DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl()));


  //! Feature - Profile
  // Bloc


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}