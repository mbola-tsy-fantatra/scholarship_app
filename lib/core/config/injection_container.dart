import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:scholariship/core/routes/auth_guard.dart';
import 'package:scholariship/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scholariship/features/auth/data/repository/auth_repository_impl.dart';
import 'package:scholariship/features/auth/domain/repository/auth_repository.dart';
import 'package:scholariship/features/auth/presentation/index.dart';
import 'package:scholariship/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:scholariship/features/profile/data/repository/profile_repository_impl.dart';
import 'package:scholariship/features/profile/domain/repository/profile_repository.dart';
import 'package:scholariship/features/profile/domain/usecases/create_user_profile.dart';
import 'package:scholariship/features/profile/domain/usecases/get_user_profile.dart';
import 'package:scholariship/features/profile/domain/usecases/upate_user_profile.dart';
import 'package:scholariship/features/profile/presentation/manager/profile_bloc.dart';
import 'package:scholariship/features/scholariship/data/datasources/scholarship_remote_data_source.dart';
import 'package:scholariship/features/scholariship/data/repository/scholarship_repository_impl.dart';
import 'package:scholariship/features/scholariship/domain/repository/scholarship_repository.dart';
import 'package:scholariship/features/scholariship/domain/usecases/find_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_academics.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_countries.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_study_level.dart';
import 'package:scholariship/features/scholariship/presentation/index.dart';
import 'package:scholariship/features/scholariship/presentation/manager/academic/academic_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/manager/country/country_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/manager/studylevel/study_level_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init()async {


  //! Feature - Auth
  // Bloc
  sl.registerFactory(
      ()=> AuthBloc(sl())
  );

  // UseCases
  sl.registerLazySingleton(()=>AuthGuard(sl()));


  // Repository
  sl.registerLazySingleton<AuthRepository>(
      ()=> AuthRepositoryImpl(client:sl(),remoteDataSource: sl(), sharedPreferences: sl())
  );


  
  // DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl()));


  //! Feature - Profile
  // Bloc
  sl.registerFactory(
      ()=>ProfileBloc(getUserProfile: sl(), createUserProfile: sl(), updateUserProfile: sl())
  );

  //UseCases
  sl.registerLazySingleton(()=> GetUserProfile(profileRepository: sl()));
  sl.registerLazySingleton(()=> CreateUserProfile(profileRepository: sl()));
  sl.registerLazySingleton(()=> UpdateUserProfile(profileRepository: sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
      ()=> ProfileRepositoryImpl(remoteDataSource: sl())
  );

  //DataSource
  sl.registerLazySingleton<UserRemoteDataSource>(()=> UserRemoteDataSourceImpl( dio: sl()));

  //! Feature - Scholarship
  // Bloc
  sl.registerFactory(()=>CountryBloc(sl()));
  sl.registerFactory(()=>StudyLevelBloc(sl()));
  sl.registerFactory(()=>AcademicBloc(sl()));
  sl.registerFactory(()=>ScholarshipBloc(sl()));


  //UseCases
  sl.registerLazySingleton(()=> GetCountries(scholarshipRepository: sl()));
  sl.registerLazySingleton(()=>GetStudyLevels(scholarshipRepository: sl()));
  sl.registerLazySingleton(()=>GetAcademics(scholarshipRepository: sl()));
  sl.registerLazySingleton(()=>FindScholarship(scholarshipRepository: sl()));

  // Repository
  sl.registerLazySingleton<ScholarshipRepository>(
      ()=>ScholarshipRepositoryImpl(remoteDataSource: sl())
  );

  // DataSources
  sl.registerLazySingleton<ScholarshipRemoteDataSource>(()=>ScholarshipRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));



  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    return dio;
  });
}