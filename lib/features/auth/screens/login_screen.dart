import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/universal_widgets/s_text_field.dart';
import 'package:jobsync/features/auth/controllers/signin_controller.dart';

import '../../../route/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final SignInController controller = Get.put(SignInController());

    return Scaffold(
      backgroundColor:Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back', style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 16),
            Text('Enter your credential to access your account.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              fontSize: 16
            )),
            const SizedBox(height: 32),
            STextField(
              textController: controller.email,
              lebelText: 'Email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            STextField(
              textController: controller.password,
              lebelText: 'Password',
              prefixIcon: Icons.lock,
              isObscure: true,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  controller.signIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Obx(
                    (){
                      return controller.isProcessing.value
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
                    }
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account? ', style: TextStyle(fontSize: 16)),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteName.signUp);
                },
                child: const Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
