import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/universal_widgets/s_snackbar.dart';
import 'package:jobsync/route/route_name.dart';

import '../../../core/local_storage/user_status.dart';

class SignInController extends GetxController {
  final RxBool isProcessing = false.obs;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GetStorage _storage = GetStorage();

  Future<void> signIn() async {
    isProcessing.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final storedEmail = _storage.read('email');
    final storedPassword = _storage.read('password');
    if (email.text == storedEmail && password.text == storedPassword) {
      SSnackbar.showSuccess('Login successful');
      UserStatus.setLoggedIn(true);
      Get.offNamed(RouteName.initialScreen);
      print('Login successful');
    } else {
      SSnackbar.showError('Invalid email or password');
      print('Invalid email or password');
    }
    isProcessing.value = false;
  }

  String? getUserName() => _storage.read('name');
  String? getUserEmail() => _storage.read('email');
  String? getUserPassword() => _storage.read('password');

  Future<void> clearUserData() async {
    await _storage.remove('name');
    await _storage.remove('email');
    await _storage.remove('password');
  }
}