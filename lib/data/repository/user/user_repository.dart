import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../common/model/job/job_model.dart';
import '../../../common/model/user/user_model.dart';
import '../../../feautures/presentation/main_route.dart';
import '../autentication/firebase_auth_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  List<JobModel> jobs = [];

  Future<void> createUser(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toMap());

      Get.snackbar(
        'Account created',
        'Account is created succesfully',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(() => const MainRoute());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> createJob(JobModel job) async {
    try {
      await _db
          .collection('jobs')
          .add(job.toMap())
          .whenComplete(() => Get.snackbar('Done', 'Created'));
    } catch (e) {
      GetSnackBar(
        title: 'Error',
        message: e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: JColors.red,
      );
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      final userData =
          await _db.collection('users').where('id', isEqualTo: id).get();
      return UserModel.fromMap(userData.docs as Map<String, dynamic>);
    } catch (e) {
      throw Exception();
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPostedJobs(
      String userId) async {
    try {
      return await _db.collection('jobs').where('id', isEqualTo: userId).get();
    } catch (e) {
      throw Exception('Failed to fetch posted jobs: $e');
    }
  }

  Future<void> applyJob(String jobId) async {
    try {
      final userId = AutenticationRepository.instance.firebaseUser.value?.uid;
      if (userId == null) {
        Get.snackbar('Error', 'User not logged in.');
        return;
      }

      final data = {
        'id': jobId,
        'userId': userId,
        'status': 'Delivered',
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _db.collection('applied').add(data);

      Get.snackbar('Success', 'Application submitted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to apply for the job: $e');
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUser(String userId) async {
    try {
      return await _db.collection('users').where('id', isEqualTo: userId).get();
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  Future<List<JobModel>> fetchAllJobs() async {
    try {
      final snapshot = await _db.collection('jobs').get();

      jobs = snapshot.docs.map((doc) {
        return JobModel.fromMap(doc.data());
      }).toList();

      return jobs;
    } catch (e) {
      throw Exception('Failed to fetch all jobs: $e');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAppliedJobs(String? userId) {
    return _db
        .collection('applied')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<JobModel> fetchJobById(String jobId) async {
    final snapshot = await _db.collection('jobs').doc(jobId).get();
    return JobModel.fromMap(
        snapshot.data()!); // Assuming JobModel has fromMap method
  }

  Future<void> updateUser() async {
    _db.collection('users');
  }
}
