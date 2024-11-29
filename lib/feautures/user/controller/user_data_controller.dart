import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/data/repository/autentication/firebase_auth_repository.dart';
import '../../../common/model/user/education.dart';
import '../../../common/model/user/location.dart';
import '../../../common/model/user/name_mode.dart';
import '../../../common/model/user/string.dart';
import '../../../common/model/user/user_model.dart';
import '../../../common/model/user/work_expriance.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../utils/helper/formatter.dart';
import '../widget/skill_list.dart';

class UserDataController extends GetxController {
  static UserDataController get instance => Get.find();
  // Controllers
  final dataController = Get.put(UserRepository());
  final controllerAuth = Get.put(AutenticationRepository());
  //// genereal ins
  RxInt currentIndex = 0.obs;
  late UserModel newUser;
  DateFormatter formatter = DateFormatter();
  RxBool isObscure = false.obs;
  final fileController = Get.put(FilePickerController());

  /// user data 1 and 2 form keys
  GlobalKey<FormState> keyData1 = GlobalKey<FormState>();
  // GlobalKey<FormState> keyData2 = GlobalKey<FormState>();

  //// user mmodel data from text fields
  late NameModel name;
  final firstname = TextEditingController();
  final middlename = TextEditingController();
  final lastname = TextEditingController();
  late Location location;
  final phoneNumber = TextEditingController();
  RxList<Education> education = <Education>[].obs;
  RxList<WorkExpriance> expriance = <WorkExpriance>[].obs;
  List<StringList> skills = [];
  List<Map<String, dynamic>> selectList = [
    {'id': '1', 'name': 'Communication', 'isSelected': false.obs},
    {'id': '2', 'name': 'Dedication', 'isSelected': false.obs},
    {'id': '3', 'name': 'Hard Working', 'isSelected': false.obs},
    {'id': '4', 'name': 'Programming', 'isSelected': false.obs},
    {'id': '5', 'name': 'Problem Solving', 'isSelected': false.obs},
    {'id': '6', 'name': 'Critical Thinking', 'isSelected': false.obs},
  ];
  List<StringList> language = [];
  Rx<String> country = ''.obs;
  Rx<String> city = ''.obs;
  Rx<String> state = ''.obs;
  TextEditingController title = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();
  GlobalKey<FormState> keyedu = GlobalKey<FormState>();
  final TextEditingController dob = TextEditingController();
  final TextEditingController startDateEdu = TextEditingController();
  final TextEditingController endDateEdu = TextEditingController();
  final TextEditingController titleEdu = TextEditingController();
  final TextEditingController instNameEdu = TextEditingController();
  GlobalKey<FormState> keyEdu = GlobalKey<FormState>();
  void addExperience() {
    expriance.value = [];
    expriance.add(
      WorkExpriance(
        positionTitle: title.text.trim(),
        componyName: companyName.text.trim(),
        description: description.text.trim(),
        startDate: startDate.text.trim(),
        endDate: endDate.text.trim(),
      ),
    );
  }

  void resetFields() {
    title.clear();
    companyName.clear();
    description.clear();
    startDate.clear();
    endDate.clear();
  }

  void addEducation() {
    education.add(
      Education(
        endDate: endDateEdu.text.trim(),
        inistitutionName: instNameEdu.text.trim(),
        startDate: startDateEdu.text.trim(),
        title: titleEdu.text.trim(),
      ),
    );
  }

  void resetFieldsEdu() {
    startDateEdu.clear();
    endDateEdu.clear();
    titleEdu.clear();
    instNameEdu.clear();
  }

  Future<dynamic> addSkills(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => skillList(selectList),
    );
  }

  void addSelectedSkills() {
    skills.clear(); // Clear existing skills
    for (var skill in selectList) {
      if (skill['isSelected'].value) {
        skills.add(StringList(
          id: skill['id'],
          content: skill['name'],
        ));
        skill['isSelected'].value = false; // Reset selection
      }
    }
    update(); // Notify listeners about the changes
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

  Future<void> uploadImage() async {
    try {
      final path = fileController.selectedImage.value!.path;
      final desPath = 'users/$path';
      final file = File(path);
      final ref = FirebaseStorage.instance.ref().child(desPath);
      await ref.putFile(file);
    } catch (e) {
      Get.snackbar('Error', 'error ${e.toString()}');
    }
  }

  void addName() {
    try {
      name = NameModel(
        first: firstname.text.trim(),
        middle: middlename.text.trim(),
        last: lastname.text.trim(),
      );
      Get.snackbar(
        "Success",
        "Name added successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add name: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void addLocation() {
    try {
      location = Location(
        cityName: city.value,
        countryName: country.value,
      );
      Get.snackbar(
        "Success",
        "Location added successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add location: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void saveUserModel() {
    try {
      if (key2.currentState!.validate()) {
        newUser = UserModel(
          id: controllerAuth.firebaseUser.value!.uid,
          name: name,
          imagePath: fileController.selectedImage.toString(),
          location: location,
          dateOfBirth: dob.text.trim(),
          email: AutenticationRepository.instance.firebaseUser.value!.email,
          phoneNumber: double.parse(phoneNumber.text.trim()),
          workExpriance: expriance,
          education: education,
          skills: skills,
          language: [
            StringList(id: '1', content: 'English'),
            StringList(id: '2', content: 'Amharic'),
          ],
        );
        Get.snackbar(
          "Success",
          "User model saved successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error",
          "Validation failed for user model",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to save user model: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> saveData() async {
    try {
      Get.snackbar(
        "Info",
        "Save data function called",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );

      // Call helper methods
      addLocation();
      addName();
      saveUserModel();

      // Attempt to save to repository
      await dataController.createUser(newUser);

      Get.snackbar(
        "Success",
        "User data saved successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to save user data: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void next() {
    if (keyData1.currentState!.validate() &&
        country.value.isNotEmpty &&
        city.value.isNotEmpty &&
        state.value.isNotEmpty) {
      currentIndex.value = 1;
    }
  }

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
}
