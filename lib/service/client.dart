import 'package:dio/dio.dart';

class Client {
  static const _baseUrl = "https://c2c5-94-129-79-25.eu.ngrok.io/";
  static final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
}
