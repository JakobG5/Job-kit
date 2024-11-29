import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import '../../../common/style/text_style.dart';
import '../../../common/widget/comment_text_formField.dart';
import '../../../common/widget/text_form_field.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/validators/validator.dart';
import '../controller/job_controller.dart';

class JobDataOne extends StatelessWidget {
  const JobDataOne({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JobPostController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: JSpace.space16),
                const Center(
                  child: Text(
                    'Give us a description about the job and your company',
                    style: JTStyle.header,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: JSpace.space16),
                Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap: controller.fileController.pickImageJob,
                      child: Container(
                        height: 104,
                        width: 104,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: JColors.white,
                        ),
                        child:
                            controller.fileController.selectedImageJob.value !=
                                    null
                                ? ClipOval(
                                    child: Image.file(
                                      controller.fileController.selectedImageJob
                                          .value!,
                                      fit: BoxFit.cover,
                                      height: 104,
                                      width: 104,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 104,
                                    color: JColors.greyMuted,
                                  ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: JSpace.space32),
                Form(
                  key: controller.formOne,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.componyName,
                        inputType: TextInputType.text,
                        isObscure: controller.isObscure,
                        label: 'Company Name',
                        validator: (value) => Validator.validateName(value!),
                        prefixIcon: Icons.business,
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomTextFormField(
                        controller: controller.positionTitle,
                        inputType: TextInputType.text,
                        isObscure: controller.isObscure,
                        label: 'Position Title',
                        validator: (value) => Validator.validateName(value!),
                        prefixIcon: Icons.work,
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomTextFormField(
                        controller: controller.field,
                        inputType: TextInputType.text,
                        isObscure: controller.isObscure,
                        label: 'Field',
                        validator: (value) => Validator.validateName(value!),
                        prefixIcon: Icons.category,
                      ),
                      const SizedBox(height: JSpace.space16),
                      DropdownButtonFormField<String>(
                        value: controller.durationSelected,
                        items: controller.duration
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            controller.durationSelected = value,
                        decoration:
                            const InputDecoration(labelText: 'Duration'),
                      ),
                      const SizedBox(height: JSpace.space16),
                      DropdownButtonFormField<String>(
                        value: controller.empTYSelected,
                        items: controller.employeeType
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (value) => controller.empTYSelected = value,
                        decoration:
                            const InputDecoration(labelText: 'Employee Type'),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomTextFormField(
                        controller: controller.salary,
                        inputType: TextInputType.number,
                        isObscure: controller.isObscure,
                        label: 'Salary (per month)',
                        validator: (value) => Validator.validateName(value!),
                        prefixIcon: Icons.money,
                      ),
                      const SizedBox(height: JSpace.space16),
                      const Text('Job Location'),
                      const SizedBox(height: JSpace.space8),
                      CSCPicker(
                        onCityChanged: controller.assignCity,
                        onCountryChanged: controller.assignCountry,
                        onStateChanged: controller.assignState,
                      ),
                      const SizedBox(height: JSpace.space32),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: controller.appStartDate,
                              onTap: () => controller.selectDate(
                                  context, controller.appStartDate),
                              decoration: InputDecoration(
                                hintText: 'Applicaiton Start Date',
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
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: controller.appEndDate,
                              onTap: () => controller.selectDate(
                                  context, controller.appEndDate),
                              decoration: InputDecoration(
                                hintText: 'Application Deadline',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.about,
                        isObscure: controller.isObscure,
                        label: 'About',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.description,
                        isObscure: controller.isObscure,
                        label: 'Job Description',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.describtion,
                        isObscure: controller.isObscure,
                        label: 'Job Requirements',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.point1,
                        isObscure: controller.isObscure,
                        label: 'Educational Requirements',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.point2,
                        isObscure: controller.isObscure,
                        label: 'Work Experience',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                      const SizedBox(height: JSpace.space16),
                      CustomMultiLineTF(
                        controller: controller.point3,
                        isObscure: controller.isObscure,
                        label: 'Other',
                        validator: (value) =>
                            Validator.validateDescription(value!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: JSpace.space32),
                CustomBtnOne(
                  function: controller.post,
                  btnTite: 'Post Job',
                ),
                const SizedBox(height: JSpace.space32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
