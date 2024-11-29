import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/autentication/controller/verification_controller.dart';
import '../../../utils/constants/color.dart';

class OtpVerificationField extends StatelessWidget {
  const OtpVerificationField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Form(
          child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        children: List.generate(4, (index) {
          return SizedBox(
            height: 52,
            width: 52,
            child: Obx(
              () => TextFormField(
                controller: controller.controller[index],
                enabled: controller.isEnabled(index),
                onChanged: (value) {
                  if (index == 0 && value.length == 1) {
                    controller.toogleEnbaledT(index);
                    FocusScope.of(context).nextFocus();
                  } else if (index != 0 && value.length == 1) {
                    controller.toogleEnbaledT(index);
                    FocusScope.of(context).nextFocus();
                  } else if (index != 0 && (value.isEmpty)) {
                    controller.toogleEnbaledF(index);
                    FocusScope.of(context).previousFocus();
                  }
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: JColors.borderColor,
                      )),
                  filled: true,
                  fillColor: JColors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: JColors.blackBlue,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.redAccent,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.redAccent,
                      )),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }
}
