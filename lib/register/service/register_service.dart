import 'package:flutter/foundation.dart';
import 'package:gestaofinanceira/register/model/register_model.dart';
import 'package:gestaofinanceira/register/repository/register_resository.dart';

class RegisterService {
  final RegisterRepository repository = RegisterRepository();

  Future<bool> sendRegisterData(
    String name,
    String email,
    String password,
  ) async {
    try {
      RegisterDataModel registerData = RegisterDataModel(
        name: name,
        email: email,
        password: password,
      );

      await repository.sendRegisterData(registerData);
      return true;
    } catch (exception) {
      debugPrint(exception.toString());
      return false;
    }
  }
}
