import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'watext.dart';

class BannerComponent extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const BannerComponent(
      {super.key,
      required this.title,
      required this.description,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          WaText(
            title,
            fontsize: 18.dp,
            baskerville: true,
            textAlignment: Alignment.centerLeft,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 1.h,
          ),
          WaText(
            description,
            fontsize: 14.dp,
            textAlignment: Alignment.centerLeft,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
