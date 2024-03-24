import 'package:dio/dio.dart';
import 'package:gestaofinanceira/http/app_dio.dart';
import 'package:gestaofinanceira/login/model/login_model.dart';
import 'package:gestaofinanceira/shared/helpers/constants.dart';

class LoginRepository {
  String baseUrl = "http://${Constants.hostname}:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(LoginModel model) async {
    Dio clientHttp = await AppDio.getConnection(isAuth: false);

    return clientHttp.post(baseUrl, data: model.toJson());
  }
}
