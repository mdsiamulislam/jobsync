import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobsync/core/universal_widgets/job_card.dart';
import 'package:jobsync/features/home/controllers/home_controller.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Jobs'),
      ),
      body: SafeArea(
        child: Obx(() {
          final savedList = homeController.savedJobs;
          if (savedList.isEmpty) {
            return const Center(
              child: Text(
                'No saved jobs yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: savedList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              final job = savedList[index];
              return JobCard(
                job: job,
                isSaved: true,
                isSavedJobsScreen: true,
                onRemove: () => homeController.removeSavedJob(job),
              );
            },
          );
        }),
      ),
    );
  }
}
