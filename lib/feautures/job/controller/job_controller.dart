import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/model/job/job_model.dart';
import 'package:job_kit/data/repository/autentication/firebase_auth_repository.dart';
import '../../../common/model/job/job_detail.dart';
import '../../../common/model/user/location.dart';
import '../../../common/model/user/string.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../utils/helper/formatter.dart';
import '../screen/add_job.dart';
import '../screen/post_job.dart';

class JobPostController extends GetxController {
  final fileController = Get.put(FilePickerController());
  final userController = Get.put(UserRepository());

  JobPostController get instance => Get.find();
  DateFormatter formatter = DateFormatter();
  RxInt currentIndex = 0.obs;
  RxBool isObscure = false.obs;
  GlobalKey<FormState> formOne = GlobalKey<FormState>();

  //Job Model parameters
  late JobModel jobModel;
  final componyName = TextEditingController();
  final positionTitle = TextEditingController();
  late List<StringList> fieldJ = [];
  final field = TextEditingController();
  String? empTYSelected = 'Advanced';
  String? durationSelected = 'Full Time';
  final salary = TextEditingController();
  late Location jobLocation;
  Rx<String> country = ''.obs;
  Rx<String> city = ''.obs;
  Rx<String> state = ''.obs;
  final appStartDate = TextEditingController();
  final appEndDate = TextEditingController();
  final about = TextEditingController();
  final description = TextEditingController();
  late JobDetail jobRequirement;
  final describtion = TextEditingController();
  final point1 = TextEditingController();
  final point2 = TextEditingController();
  final point3 = TextEditingController();
  late final String url;

  List duration = [
    'Full Time',
    'Part Time',
    'All',
    'Remote',
    'Intern(Paid)',
    'Intern(Un-Paid)',
  ];

  List employeeType = ['Junior', 'Intermidiate', 'Advanced'];

  Future<dynamic> postJob(BuildContext context) async {
    return showModalBottomSheet(
        context: context, builder: (ctx) => const JobPost());
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController type) async {
    // ignore: no_leading_underscores_for_local_identifiers
    DateTime? _dob = await showDatePicker(
      context: (context),
      firstDate: DateTime(1960),
      lastDate: DateTime(2050),
    );
    if (_dob == null) {
      type.text = 'date not selected';
    } else {
      type.text = formatter.formatFullDate(_dob);
    }
  }

  // void next() {}
  void assignCountry(String? value) {
    if (value != null) {
      country.value = value;
      update();
    } else {
      country.value = '';
    }
  }

  void assignCity(String? value) {
    if (value != null) {
      city.value = value;
      update();
    } else {
      city.value = '';
    }
  }

  void assignState(String? value) {
    if (value != null) {
      state.value = value;
      update();
    } else {
      state.value = '';
    }
  }

  Future<void> uploadImage() async {
    try {
      final path = fileController.selectedImageJob.value!.path;
      final desPath = 'jobs/$path';
      final file = File(path);
      final ref = FirebaseStorage.instance.ref().child(desPath);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      url = await snapshot.ref.getDownloadURL();
      Get.snackbar('uploaded', 'img uploaded');
    } catch (e) {
      Get.snackbar('Error', 'error ${e.toString()}');
    }
  }

  void addField() {
    fieldJ.add(StringList(id: '1', content: field.text.trim()));
  }

  void addRequirement() {
    jobRequirement = JobDetail(
      header: describtion.text,
      points: [
        StringList(id: '1', content: point1.text),
        StringList(id: '2', content: point2.text),
        StringList(id: '3', content: point3.text),
      ],
    );
  }

  void assignLocation() {
    jobLocation = Location(cityName: city.value, countryName: country.value);
  }

  void jobAdd() {
    jobModel = JobModel(
      id: AutenticationRepository.instance.firebaseUser.value!.uid,
      imagePath: url,
      positionTitile: positionTitle.text.trim(),
      componyNamee: componyName.text.trim(),
      field: field.text.trim(),
      duration: durationSelected!,
      employeeType: empTYSelected!,
      salary: salary.text,
      location: jobLocation,
      jobDescription: description.text.trim(),
      jobRequirements: jobRequirement,
      about: about.text.trim(),
      startDate: appStartDate.text.trim(),
      endDate: appEndDate.text.trim(),
    );
  }

  void reserFields() {
    componyName.clear();
    positionTitle.clear();
    field.clear();
    salary.clear();
    fieldJ = [];
    empTYSelected = 'Advanced';
    durationSelected = 'Full Time';
    salary.clear();
    appStartDate.clear();
    appEndDate.clear();
    about.clear();
    description.clear();
    describtion.clear();
    point1.clear();
    point2.clear();
    point3.clear();
    country.value = '';
    state.value = '';
    city.value = '';
    fileController.selectedImageJob.value = null;
  }

  Future<void> post() async {
    if (fileController.selectedImageJob.value == null) {
      Get.snackbar('Image is\'t Selected', 'Please select an image');
    } else if (formOne.currentState!.validate() &&
        (fileController.selectedImageJob.value != null)) {
      await uploadImage();
      addField();
      addRequirement();
      assignLocation();
      jobAdd();
      await userController.createJob(jobModel);
      reserFields();
      Get.off(() => const Job());
    }
  }

  // Future<List<JobModel>> fetchJobs() async{
  //   try{

  //   }catch{

  //   }
  // }
}
