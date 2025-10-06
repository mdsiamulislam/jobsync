import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsync/route/route_name.dart';
import 'package:jobsync/route/routing.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Job Sync',
      theme: ThemeData(
        textTheme: GoogleFonts.alataTextTheme(),
        primarySwatch: Colors.blue,
      ),
      getPages: RoutingList.routes,
      initialRoute: RouteName.logIn,
    );
  }
}
