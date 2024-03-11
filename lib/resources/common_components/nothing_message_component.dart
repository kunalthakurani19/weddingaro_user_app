import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';

class NothingMessageComponent extends StatelessWidget {
  final String message;
  final String imgUrl;
  const NothingMessageComponent({super.key, required this.message, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(imgUrl),
                SizedBox(
                  height: 1.h,
                ),
                WaText(
                  message,
                  fontsize: 15.dp,
                  textAlignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
