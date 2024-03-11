import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/screens/commonscreens/vendortab/vendor_search_screen.dart';

import '../color.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Alignment? textAlignment;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontsize;
  final double? horizontalPadding;

  const NormalText({
    super.key,
    required this.text,
    this.textAlignment,
    this.textAlign,
    this.color,
    this.fontsize,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 15,
      ),
      child: WaText(
        text,
        fontsize: fontsize ?? 15.dp,
        baskerville: true,
        textAlignment: textAlignment ?? Alignment.centerLeft,
        fontWeight: FontWeight.w400,
        textAlign: textAlign ?? TextAlign.start,
        textcolor: color ?? AppColors.blackColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String heading;
  final Alignment? textAlignment;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontsize;
  final bool isline;
  final double? horizontalPadding;

  const HeadingText(
      {super.key,
      required this.heading,
      this.textAlignment,
      this.textAlign,
      this.fontWeight,
      this.fontsize,
      this.isline = true,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 15,
          ),
          child: WaText(
            heading,
            fontsize: fontsize ?? 19.dp,
            baskerville: true,
            textAlignment: textAlignment ?? Alignment.centerLeft,
            fontWeight: fontWeight ?? FontWeight.bold,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ),
        isline ? const Divider() : Container()
      ],
    );
  }
}

class TextWithAroow extends StatelessWidget {
  final String heading;
  final Alignment? textAlignment;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontsize;

  const TextWithAroow({super.key, required this.heading, this.textAlignment, this.textAlign, this.fontWeight, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(context, screen: const VendorSearchScreen());
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WaText(
                heading,
                textcolor: AppColors.lightRed,
                fontsize: fontsize ?? 14.dp,
                baskerville: true,
                textAlignment: textAlignment ?? Alignment.center,
                fontWeight: fontWeight ?? FontWeight.bold,
                textAlign: textAlign ?? TextAlign.center,
              ),
              SizedBox(
                width: 2.w,
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ],
      ),
    );
  }
}
