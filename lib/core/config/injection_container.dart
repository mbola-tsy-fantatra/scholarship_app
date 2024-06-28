import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:scholariship/core/routes/auth_guard.dart';
import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scholariship/features/auth/data/repository/auth_repository_impl.dart';
import 'package:scholariship/features/auth/domain/repository/auth_repository.dart';
import 'package:scholariship/features/auth/domain/usecases/logout.dart';
import 'package:scholariship/features/auth/presentation/index.dart';
import 'package:scholariship/features/connection/data/datasources/connection_remote_data_sources.dart';
import 'package:scholariship/features/connection/data/repository/connection_repository_impl.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/features/connection/domain/usecases/get_connection_request_received.dart';
import 'package:scholariship/features/connection/domain/usecases/get_connection_request_sent.dart';
import 'package:scholariship/features/connection/presentation/index.dart';
import 'package:scholariship/features/connection/presentation/manager/connection_request/connection_request_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/connection_sent/connection_sent_bloc.dart';
import 'package:scholariship/features/messages/repositories/conversation_repository.dart';
import 'package:scholariship/features/messages/repositories/message_repositiory.dart';
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
import 'package:scholariship/features/scholariship/domain/usecases/create_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/usecases/find_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_academics.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_countries.dart';
import 'package:scholariship/features/scholariship/domain/usecases/get_study_level.dart';
import 'package:scholariship/features/scholariship/presentation/index.dart';
import 'package:scholariship/features/scholariship/presentation/manager/academic/academic_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/manager/country/country_bloc.dart';
import 'package:scholariship/features/scholariship/presentation/manager/studylevel/study_level_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/connection/domain/usecases/get_connection_request.dart';
import '../../features/connection/domain/usecases/send_connection_request.dart';

final sl = GetIt.instance;

Future<void> init()async {
  //feature Messaging
  sl.registerLazySingleton<SocketManager>(() => SocketManager(sharedPreferences: sl()));
  sl.registerLazySingleton<ConversationRepository>(() => ConversationRepository(socketManager: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<MessageRepositiory>(() => MessageRepositiory(socketManager: sl(), sharedPreferences: sl()));

  //)
  //! Feature - Auth
  // Bloc
  sl.registerFactory(
      ()=> AuthBloc(sl())
  );

  // UseCases
  sl.registerLazySingleton(()=>AuthGuard(sl()));
  sl.registerLazySingleton(()=>Logout(sharedPreferences: sl()));


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
  sl.registerFactory(()=>ScholarshipBloc(sl(),sl()));


  //UseCases
  sl.registerLazySingleton(()=>CreateScholarshipCase(scholarshipRepository: sl()));
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


  //! Feature - Connection
  // Bloc
  sl.registerFactory(()=>ConnectionBloc(getConnectionRequest: sl()));
  sl.registerFactory(()=>ConnectionRequestBloc(getConnectionRequestReceived: sl()));
  sl.registerFactory(()=>ConnectionSentBloc(getConnectionRequestSent: sl()));

  //UseCases
  sl.registerLazySingleton(()=>SendConnectionRequest(connectionRepository: sl()));
  sl.registerLazySingleton(()=>GetConnectionRequestReceived(connectionRepository: sl()));
  sl.registerLazySingleton(()=>GetConnectionRequestSent(connectionRepository: sl()));
  sl.registerLazySingleton(()=>GetConnectionRequest(connectionRepository: sl()));

  //Repository
  sl.registerLazySingleton<ConnectionRepository>(()=>ConnectionRepositoryImpl(remoteDataSources: sl()));

  //DataSources
  sl.registerLazySingleton<ConnectionRemoteDataSources>(()=>ConnectionRemoteDataSourceImpl(sharedPreferences: sl(), client: sl()));

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