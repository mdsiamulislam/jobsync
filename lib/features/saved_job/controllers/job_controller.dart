import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/job.dart';

class JobController extends GetxController {
  var savedJobs = <Job>[].obs;
  var appliedJobs = <Job>[].obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadLocalJobs();
  }

  void saveJob(Job job) {
    if (!savedJobs.any((j) => j.id == job.id)) {
      savedJobs.add(job);
      box.write('savedJobs', savedJobs.map((e) => e.toJson()).toList());
    }
  }

  void applyJob(Job job) {
    if (!appliedJobs.any((j) => j.id == job.id)) {
      appliedJobs.add(job);
      box.write('appliedJobs', appliedJobs.map((e) => e.toJson()).toList());
    }
  }

  void loadLocalJobs() {
    final saved = box.read('savedJobs');
    final applied = box.read('appliedJobs');
    if (saved != null) {
      savedJobs.value = List<Job>.from(saved.map((e) => Job.fromJson(e)));
    }
    if (applied != null) {
      appliedJobs.value = List<Job>.from(applied.map((e) => Job.fromJson(e)));
    }
  }

  void removeSavedJob(Job job) {
    savedJobs.removeWhere((j) => j.id == job.id);
    box.write('savedJobs', savedJobs.map((e) => e.toJson()).toList());
  }
}
