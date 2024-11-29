import 'package:get/get.dart';
import 'package:job_kit/common/model/user/education.dart';
import '../../../common/model/user/work_expriance.dart';
import '../../../utils/constants/enum/gender.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  late Rx<Gender?> gender;

  void function(Gender? val) {
    gender.value = val;
  }

  final expriance = [
    WorkExpriance(
      componyName: 'EagleLion System Technologies',
      positionTitle: 'Mobile App Developer',
      endDate: 'DateTime(20023, 8, 4)',
      startDate: ' DateTime(2023, 10, 4)',
      description: '',
    ),
  ];

  final education = [
    Education(
      title: 'Computer Science',
      inistitutionName: 'Bahir Dar University',
      startDate: 'DateTime.now()',
      endDate: 'DateTime.now()',
    ),
  ];
}
