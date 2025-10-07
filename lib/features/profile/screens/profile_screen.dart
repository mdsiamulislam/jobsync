import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/local_storage/user_auth.dart';
import 'package:jobsync/core/universal_widgets/menu_item.dart';
import 'package:jobsync/core/universal_widgets/stat_card.dart';
import 'package:jobsync/features/home/controllers/home_controller.dart';
import 'package:jobsync/features/profile/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {

    final ProfileController controller = Get.put(ProfileController());

    final HomeController homeController = Get.find<HomeController>();

    UserAuth userAuth = UserAuth();



    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20.0),

            child: Column(

              children: [

                CircleAvatar(

                  radius: 60,

                  backgroundColor: Colors.grey[300],

                  child: const Icon(

                    Icons.person,

                    size: 60,

                    color: Colors.white,

                  ),

                ),



                const SizedBox(height: 20),



                 Text(

                  userAuth.getName() ?? 'Name',

                  style: TextStyle(

                    fontSize: 26,

                    fontWeight: FontWeight.bold,

                  ),

                ),



                const SizedBox(height: 5),



                Text(

                  userAuth.getEmail() ?? 'example@mail.com',

                  style: TextStyle(

                    fontSize: 16,

                    color: Colors.grey[600],

                  ),

                ),



                const SizedBox(height: 30),



                Row(

                  children: [

                    Obx(

                        (){

                          return Expanded(

                            child: StatCard(label: 'Applied', value: homeController.appliedJobs.length.toString()),

                          );

                        }

                    ),

                    const SizedBox(width: 15),

                    Obx(

                        (){

                          return Expanded(

                            child: StatCard(label: 'Saved', value: homeController.savedJobs.length.toString()),

                          );

                        }

                    ),

                  ],

                ),



                const SizedBox(height: 30),





                const SizedBox(height: 10),

                MenuItem(

                  icon: Icons.help_outline,

                  title: 'Help & Support',

                  onTap: () {},

                ),

                const SizedBox(height: 10),

                MenuItem(

                  icon: Icons.privacy_tip_outlined,

                  title: 'Privacy Policy',

                  onTap: () {},

                ),

                const SizedBox(height: 30),



                MenuItem(

                  icon: Icons.logout,

                  title: 'Logout',

                  onTap: () => controller.logout(),

                ),



                const SizedBox(height: 10),



                MenuItem(

                  icon: Icons.delete_outline,

                  title: 'Delete Account',

                  onTap: () {

                    Get.dialog(

                      AlertDialog(

                        title: const Text('Delete Account'),

                        content: const Text(

                            'Are you sure you want to delete your account? This action cannot be undone.'),

                        actions: [

                          TextButton(

                            onPressed: () => Get.back(),

                            child: const Text('Cancel'),

                          ),

                          TextButton(

                            onPressed: () => controller.deleteAccount(),

                            child: const Text(

                              'Delete',

                              style: TextStyle(color: Colors.red),

                            ),

                          ),

                        ],

                      ),

                    );

                  },

                  isDelete: true,

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}
