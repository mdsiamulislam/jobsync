import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/universal_widgets/s_text_field.dart';
import 'package:jobsync/features/auth/controllers/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor:Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Account', style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 16),
            Text('Enter your details to create a new account.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                fontSize: 16
            )),
            const SizedBox(height: 32),
            STextField(
              textController: controller.name,
              lebelText: 'Full Name',
              prefixIcon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
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
                  controller.signUp();
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
                          ? const CircularProgressIndicator(color: Colors.white)
                          :Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
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
              const Text('Already have an Account ? ', style: TextStyle(fontSize: 16)),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: const Text('Sign In', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
