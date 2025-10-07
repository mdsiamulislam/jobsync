import 'package:get/get.dart';
import 'package:jobsync/features/auth/screens/login_screen.dart';
import 'package:jobsync/features/auth/screens/signup_screen.dart';
import 'package:jobsync/features/job/screens/job_details_screen.dart';
import 'package:jobsync/features/main_screen.dart';
import 'package:jobsync/route/route_name.dart';

class RoutingList {
  static final routes = [
    GetPage(
      name: RouteName.initialScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteName.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: RouteName.jobDetails,
      page: () => const JobDetailsScreen(),
    ),
  ];
}