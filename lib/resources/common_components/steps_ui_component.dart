import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';

import '../color.dart';

class StepUIComponent extends StatelessWidget {
  final String iconURl;
  final String stepText;
  final String stepDescription;
  final String estimatedText;

  const StepUIComponent(
      {super.key, required this.iconURl, required this.stepText, required this.stepDescription, required this.estimatedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 2.0, style: BorderStyle.solid), //Border.all

        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 20.0,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: .h,
            // ),
            Image.asset(
              iconURl,
              height: 60,
              width: 60,
            ),
            SizedBox(
              height: 1.h,
            ),
            WaText(
              stepText,
              fontsize: 17.dp,
              // textAlignment: Alignment.center,
              fontWeight: FontWeight.bold,
              // textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
            WaText(
              stepDescription,
              fontsize: 17.dp,
              // textAlignment: Alignment.center,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              textcolor: AppColors.darkRed,
            ),
            SizedBox(
              height: 1.h,
            ),
            WaText(
              estimatedText,
              fontsize: 14.dp,
              // textAlignment: Alignment.center,
              textAlign: TextAlign.center,
              // fontWeight: FontWeight,
              textcolor: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
