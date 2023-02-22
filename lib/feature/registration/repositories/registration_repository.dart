import 'package:dio/dio.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:driver/feature/registration/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    UserInfoModel userInfoData = await getMe();

    await prefs.setString('id', userInfoData.id ?? '');

    return result;
  }

  Future<UserInfoModel> getMe() async {
    final userInfo = await dio.get(
      'accounts/me/',
    );
    return UserInfoModel.fromJson(userInfo.data);
  }
}
