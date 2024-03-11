import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/appstyle.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';

class WAButton extends StatelessWidget {
  final Function(String message)? onError;
  final bool? loading;
  final String text;
  final Color? buttonColor, borderColor, loaderColor;
  final Function()? onPressed;
  final double? borderRadius;
  final double? width, height;
  final Color? color;
  final bool? clicked;
  final FontWeight? fontWeight;
  final double? fontsize;

  const WAButton(this.text,
      {this.onPressed,
      this.buttonColor,
      this.borderColor,
      this.borderRadius,
      this.width,
      this.height,
      this.loading,
      this.loaderColor,
      super.key,
      this.onError,
      this.color,
      this.clicked,
      this.fontWeight,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.1),
          foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color?>(
            buttonColor ?? AppColors.darkRed,
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              width: 1.0,
              color: borderColor ?? AppColors.transparent,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
        ),
        onPressed: (clicked ?? false) ? null : onPressed,
        child: loading == true
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.2.dp,
                    color: AppColors.whiteColor,
                  ),
                ),
              )
            : WaText(
                text,
                // textcolor: color ?? WAColors.whiteColor,
                fontWeight: fontWeight ?? FontWeight.w600,
                style: AppStyles.inter.copyWith(
                  fontSize: fontsize ?? 16.0,
                  fontWeight: FontWeight.w600,
                  color: color ?? AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}
