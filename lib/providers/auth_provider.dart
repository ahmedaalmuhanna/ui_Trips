import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:trips_iu/models/user.dart';
import 'package:trips_iu/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips_iu/service/client.dart';

class AuthProvider extends ChangeNotifier {
  late User user;
  String token = '';

  // Signup - POST a User to the back end.
  /// this function link the frunt end with the back end
  /// it send the data " User data" to the server fo creat a user,
  /// and it takes the token.
  void signUp(User myUser) async {
    await AuthService().signUp(myUser);

    notifyListeners();
  }

  Future<void> signIn(User myUser) async {
    print("**********provider********");

    token = await AuthService().signIn(myUser);
    setToken(token);
    notifyListeners();
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("myToken");
    print("token:\n$token ");
    token = "";
    print("token:\n$token ");
    notifyListeners();
  }
  //  setToken:
  //  to store the token in the phone

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("myToken") ??
        ""; // if mytaken is empty asign it to "" << empty
  }

  bool get isAuth {
    getToken();
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      // var json = Jwt.parseJwt();
      user = User.fromJson(token); // ?
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: "Bearer  $token"
      };
      return true;
    } else {
      logOut();
      return false;
    }
  }

  void printToken() {
    print("Token: \n${token}");
  }
}

// Jun 22, 2022 01:38
