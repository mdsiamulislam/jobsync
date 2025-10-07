import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:jobsync/core/universal_widgets/s_snackbar.dart';
import '../models/job_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var jobList = <JobModel>[].obs;
  var filteredJobs = <JobModel>[].obs;
  var searchQuery = ''.obs;

  final storage = GetStorage();

  final String savedJobsKey = 'savedJobs';
  final String appliedJobsKey = 'appliedJobs';

  RxList<JobModel> savedJobs = <JobModel>[].obs;
  RxList<JobModel> appliedJobs = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
    loadLocalJobs();

    debounce(searchQuery, (_) => filterJobs(), time: const Duration(milliseconds: 300));
  }

  void filterJobs() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredJobs.value = jobList;
    } else {
      filteredJobs.value = jobList
          .where((job) =>
              job.title.toLowerCase().contains(query) ||
              job.brand.toLowerCase().contains(query) ||
              job.category.toLowerCase().contains(query))
          .toList();
    }
  }

  Future<void> fetchJobs() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=10'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final products = data['products'] as List;

        jobList.value = products.map((e) => JobModel.fromJson(e)).toList();
        filteredJobs.value = jobList;
      } else {
        errorMessage('Failed to fetch jobs: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void loadLocalJobs() {
    final saved = storage.read<List>(savedJobsKey) ?? [];
    final applied = storage.read<List>(appliedJobsKey) ?? [];

    savedJobs.value = saved.map((e) => JobModel.fromJson(e)).toList();
    appliedJobs.value = applied.map((e) => JobModel.fromJson(e)).toList();
  }

  void saveJob(JobModel job) {
    if (!savedJobs.any((j) => j.id == job.id)) {
      savedJobs.add(job);
      storage.write(savedJobsKey, savedJobs.map((j) => _jobToJson(j)).toList());
      SSnackbar.showSuccess('Job has been saved successfully 🎉');
    } else {
      SSnackbar.showError('This job is already in your saved list.');
    }
  }

  void applyJob(JobModel job) {
    if (!appliedJobs.any((j) => j.id == job.id)) {
      appliedJobs.add(job);
      storage.write(appliedJobsKey, appliedJobs.map((j) => _jobToJson(j)).toList());
      SSnackbar.showSuccess('You have successfully applied for this job 🎉');
    } else {
      SSnackbar.showError('You have already applied for this job.');
    }
  }

  void removeSavedJob(JobModel job) {
    savedJobs.removeWhere((j) => j.id == job.id);
    storage.write(savedJobsKey, savedJobs.map((j) => _jobToJson(j)).toList());
    SSnackbar.showSuccess('Job has been removed from your saved list.');
  }

  Map<String, dynamic> _jobToJson(JobModel job) => {
    'id': job.id,
    'title': job.title,
    'description': job.description,
    'brand': job.brand,
    'category': job.category,
    'price': job.price,
    'thumbnail': job.thumbnail,
  };
}
