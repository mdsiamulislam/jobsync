import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/local_storage/user_status.dart';
import 'package:jobsync/core/universal_widgets/s_snackbar.dart';
import 'package:jobsync/route/route_name.dart';

class SignUpController extends GetxController {
  final RxBool isProcessing = false.obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GetStorage _storage = GetStorage();

  Future<void> signUp() async {
    clearUserData();
    isProcessing.value = true;
    await Future.delayed(const Duration(seconds: 1));
    await _storage.write('name', name.text);
    await _storage.write('email', email.text);
    await _storage.write('password', password.text);
    SSnackbar.showSuccess('Account created successfully');
    isProcessing.value = false;
    UserStatus.setLoggedIn(true);
    Get.offAllNamed(RouteName.initialScreen);
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