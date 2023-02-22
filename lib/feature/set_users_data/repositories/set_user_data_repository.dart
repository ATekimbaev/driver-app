import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core_data/consts_data/consts_data.dart';
import '../../registration/models/user_info_model.dart';

class SetUsersDataRepository {
  final Dio dio;
  SetUsersDataRepository({required this.dio});

  Future<void> setPassword({required String password}) async {
    await dio.post(
      'accounts/set-password/',
      data: {'password': password},
    );
  }

  Future<void> setUserName(
      {required String name, required String userName}) async {
    final prefs = await SharedPreferences.getInstance();

    await dio.put(
      'accounts/${prefs.getString(AppConsts.userId)}/',
      data: {'name': name, 'username': userName},
    );
  }
}
