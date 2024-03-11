import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppStyles {
  static TextStyle libreBaskerville = GoogleFonts.libreBaskerville(
    color: AppColors.whiteColor,
  );
  static TextStyle inter = GoogleFonts.inter(
    color: AppColors.whiteColor,
  );

  static bool isCompactView(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static var normalTextSizeStyle = TextStyle(
    // fontFamily: montserratStyle,
    fontSize: 13.dp,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
    decoration: TextDecoration.none,
  );
}
