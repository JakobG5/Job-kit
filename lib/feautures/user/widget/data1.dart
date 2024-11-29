import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/style/text_style.dart';
import '../../../common/widget/text_form_field.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/validators/validator.dart';
import '../controller/user_data_controller.dart';

Widget dataOne(BuildContext context) {
  final controller = Get.put(UserDataController());
  final fileController = Get.put(FilePickerController());

  return Form(
    key: controller.keyData1,
    child: ListView(
      children: [
        const SizedBox(height: JSpace.space16),
        const Center(
          child: Text(
            'Tell us something about yourself',
            style: JTStyle.header,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: JSpace.space16),
        Center(
          child: Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: fileController.pickImage,
                  child: Container(
                    height: 104,
                    width: 104,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: JColors.white),
                    child: fileController.selectedImage.value == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(54),
                            child: const Icon(Icons.person,
                                size: 104, color: JColors.greyMuted),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(104),
                            child: Image.file(
                              fileController.selectedImage.value!,
                              fit: BoxFit.cover,
                              height: 104,
                              width: 104,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: JSpace.space16),
                const Text('Please pick an image')
              ],
            ),
          ),
        ),
        const SizedBox(height: JSpace.space32),
        const Text('First Name'),
        const SizedBox(height: JSpace.space8),
        CustomTextFormField(
          controller: controller.firstname,
          inputType: TextInputType.text,
          isObscure: controller.isObscure,
          label: '',
          validator: (val) => Validator.validateName(val!),
          prefixIcon: Icons.person,
          autoCapitalize: TextCapitalization.words,
        ),
        const SizedBox(height: JSpace.space32),
        const Text('Middle Name'),
        const SizedBox(height: JSpace.space8),
        CustomTextFormField(
          controller: controller.middlename,
          inputType: TextInputType.text,
          isObscure: controller.isObscure,
          label: '',
          validator: (val) => Validator.validateName(val!),
          prefixIcon: Icons.person,
          autoCapitalize: TextCapitalization.words,
        ),
        const SizedBox(height: JSpace.space32),
        const Text('Last Name'),
        const SizedBox(height: JSpace.space8),
        CustomTextFormField(
          controller: controller.lastname,
          inputType: TextInputType.text,
          isObscure: controller.isObscure,
          label: '',
          validator: (val) => Validator.validateName(val!),
          prefixIcon: Icons.person,
          autoCapitalize: TextCapitalization.words,
        ),
        const SizedBox(height: JSpace.space32),
        const Text('Phone number'),
        const SizedBox(height: JSpace.space8),
        CustomTextFormField(
          controller: controller.phoneNumber,
          inputType: TextInputType.number,
          isObscure: controller.isObscure,
          label: '',
          validator: (val) => Validator.validatePhoneNumber(val!),
          prefixIcon: Icons.phone,
        ),
        const SizedBox(height: JSpace.space32),
        const Text('Location'),
        const SizedBox(height: JSpace.space8),
        CSCPicker(
          onCityChanged: (value) =>
              value != null ? controller.assignCity(value) : null,
          onCountryChanged: (value) =>
              // ignore: unnecessary_null_comparison
              value != null ? controller.assignCountry(value) : null,
          onStateChanged: (value) =>
              value != null ? controller.assignState(value) : null,
        ),
        const SizedBox(height: JSpace.space32),
        const Text('Date of Birth'),
        const SizedBox(height: JSpace.space8),
        TextField(
          readOnly: true,
          controller: controller.dob,
          onTap: () => controller.selectDate(context, controller.dob),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: JColors.borderColor,
                )),
            filled: true,
            hintStyle: const TextStyle(
              color: JColors.borderColor,
              fontSize: 14,
            ),
            fillColor: JColors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: JColors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
