import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/job_controller.dart';
import '../models/job.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobController jobController = Get.put(JobController());

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final savedList = jobController.savedJobs;

          if (savedList.isEmpty) {
            return const Center(
              child: Text(
                'No saved jobs yet 😔',
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
              return SavedJobCard(
                job: job,
                onRemove: () => jobController.removeSavedJob(job),
              );
            },
          );
        }),
      ),
    );
  }
}

class SavedJobCard extends StatelessWidget {
  final Job job;
  final VoidCallback onRemove;

  const SavedJobCard({
    Key? key,
    required this.job,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Job Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    job.brand ?? 'Unknown Company',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    job.category ?? 'Remote',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${job.price.toString()} / yr',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            // Remove Button
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              tooltip: 'Remove',
            ),
          ],
        ),
      ),
    );
  }
}
