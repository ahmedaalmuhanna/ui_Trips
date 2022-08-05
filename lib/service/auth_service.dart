import 'package:dio/dio.dart';
import 'package:trips_iu/models/user.dart';
import 'package:trips_iu/service/client.dart';
import 'package:trips_iu/providers/auth_provider.dart';
import 'package:trips_iu/service/trips_service.dart';

class AuthService {
  final _dio = Dio();

  // Signup
  //// we want to return the token
  Future<void> signUp(User myUserAuth) async {
    String token = "";
    try {
      print(myUserAuth.toJson());
      Response myResponse = await Client.dio
          .post("register/", data: myUserAuth.toJson()); // path " APT"
      // print(myResponse);
      //  token = myResponse.data.token;
    } on DioError catch (error) {
      print(error);
    }
  }

  Future<String> signIn(User myUserAuth) async {
    late String token;
    try {
      Response myResponse = await Client.dio
          .post("login/", data: myUserAuth.toJson()); // path " APT"

      token = myResponse.data["access"];
    } on DioError catch (error) {
      print(error.message);
    }
    return token;
  }
}
