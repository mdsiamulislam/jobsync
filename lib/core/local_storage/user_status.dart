import 'package:get_storage/get_storage.dart';

class UserStatus {

  static Future<void> setLoggedIn(bool value) async {
    await GetStorage().write('isLoggedIn', value);
  }
  static bool isLoggedIn() => GetStorage().read('isLoggedIn') ?? false;

}