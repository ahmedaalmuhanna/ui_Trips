import 'package:flutter/cupertino.dart';
import 'package:trips_iu/models/user.dart';
import 'package:trips_iu/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  late User user;
  late String token;

  // Signup - POST a User to the back end.
  /// this function link the frunt end with the back end
  /// it send the data " User data" to the server fo creat a user,
  /// and it takes the token.
  void signUp(User myUser) async {
    token = await AuthService().signUp(myUser);
  }
}

// Jun 22, 2022 01:38
