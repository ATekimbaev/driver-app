import 'package:dio/dio.dart';
import 'package:driver/core%20/consts/consts.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository({required this.dio});

  Future<void> getToken(
      {required String username, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await dio.post(
      'accounts/login/',
      data: {
        'username': username,
        'password': password,
      },
    );

    final result = TokenModel.fromJson(response.data);
    await prefs.setString(AppConsts.accesToken, result.access ?? '');
    await prefs.setString(AppConsts.refreshToken, result.refresh ?? '');
  }
}
