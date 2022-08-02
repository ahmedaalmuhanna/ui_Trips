import 'package:dio/dio.dart';
import 'package:trips_iu/models/user.dart';

class AuthService {
  final _dio = Dio();

  // Signup
  //// we want to return the token
  Future<String> signUp(User myUserAuth) async {
    late String token;
    try {
      Response myResponse =
          await _dio.post("path", data: myUserAuth.toJson()); // path " APT"
      token = myResponse.data.token;
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
