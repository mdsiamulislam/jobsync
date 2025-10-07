import 'package:get_storage/get_storage.dart';

class UserAuth {
  final GetStorage _storage = GetStorage();

  Future<void> saveUserData({required String name, required String email, required String password}) async {
    await _storage.write('name', name);
    await _storage.write('email', email);
    await _storage.write('password', password);
  }

  String? getName() => _storage.read('name');
  String? getEmail() => _storage.read('email');
  String? getPassword() => _storage.read('password');

  Future<void> clearUserData() async {
    await _storage.remove('name');
    await _storage.remove('email');
    await _storage.remove('password');
  }
}