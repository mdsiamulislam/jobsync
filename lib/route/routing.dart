import 'package:get/get.dart';
import 'package:jobsync/features/auth/screens/login_screen.dart';
import 'package:jobsync/features/auth/screens/signup_screen.dart';
import 'package:jobsync/features/job/screens/job_details_screen.dart';
import 'package:jobsync/route/route_name.dart';

import '../features/initial_screen.dart';

class RoutingList{

  static final routes = [

    GetPage(
      name: RouteName.logIn,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteName.signUp,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteName.initialScreen,
      page: () => const InitialScreen(),
    ),
    GetPage(
      name: RouteName.details,
      page: () => const JobDetailsScreen(),
    )

  ];

}