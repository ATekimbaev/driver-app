import 'package:dio/dio.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:driver/feature/registration/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core /consts/consts_data.dart';

class RegistrationRepository {
  final Dio dio;
  RegistrationRepository({required this.dio});

  Future<TokenModel> registration({required String otp}) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await dio.post(
      'accounts/tg-login/',
      data: {'otp': otp},
    );
    final result = TokenModel.fromJson(response.data);
    await prefs.setString('accessToken', result.access ?? '');
    await prefs.setString('refreshToken', result.refresh ?? '');
    final userInfo = await dio.get(
      'accounts/me/',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
    final UserInfoModel userInfoData = UserInfoModel.fromJson(userInfo.data);

    await prefs.setString('id', userInfoData.id ?? '');

    return result;
  }
}
