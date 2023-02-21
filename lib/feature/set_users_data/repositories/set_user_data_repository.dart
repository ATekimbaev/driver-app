import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core /consts/consts_data.dart';

class SetUsersDataRepository {
  final Dio dio;
  SetUsersDataRepository({required this.dio});

  Future<void> setPassword({required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    await dio.post(
      'accounts/set-password/',
      data: {'password': password},
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
  }

  Future<void> setUserName(
      {required String name, required String userName}) async {
    final prefs = await SharedPreferences.getInstance();
    await dio.put(
      'accounts/${prefs.getString(AppConsts.userId)}/',
      data: {'name': name, 'username': userName},
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
  }
}
