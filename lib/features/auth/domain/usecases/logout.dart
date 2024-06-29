import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends UseCase<bool,NoParams>{

  final SharedPreferences sharedPreferences;

  Logout({required this.sharedPreferences});

  @override
  Future<Either<Failure, bool>?> call(params)async {
    print("mandeha ve ");
     try{
       await sharedPreferences.remove('access_token');
       await sharedPreferences.remove('user_id');
       print(sharedPreferences.getString('user_id'));
       print(sharedPreferences.getString('access_token'));
       return const Right(true);
     }catch (e) {
       throw ServerFailure();
     }
  }

}