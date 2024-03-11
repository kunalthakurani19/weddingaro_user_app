// import 'package:flutter/material.dart';
// import 'package:wedding_planner_app/res/appstyle.dart';
// import 'package:wedding_planner_app/res/color.dart';

// class WaText extends StatelessWidget {
//   final String text;
//   final TextStyle? style;
//   final bool baskerville;
//   final TextAlign? textAlign;
//   final int? maxLines;
//   final Color? textcolor;
//   final TextOverflow? overflow;
//   final FontWeight? fontWeight;
//   final double? fontsize;
//   final FontStyle? fontStyle;

//   const WaText(this.text,
//       {super.key,
//       this.style,
//       this.textAlign,
//       this.maxLines,
//       this.overflow,
//       this.textcolor,
//       this.baskerville = false,
//       this.fontWeight,
//       this.fontsize,
//       this.fontStyle});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       overflow: overflow,
//       style: TextStyle(
//           fontSize: fontsize ?? 18.0,
//           fontWeight: fontWeight ?? FontWeight.normal,
//           color: textcolor ?? AppColors.whiteColor,
//           // fontStyle: fontStyle ?? AppStyles.libreBaskerville.fontf,
//           fontFamily: baskerville
//               ? AppStyles.libreBaskerville.fontFamily
//               : AppStyles.inter.fontFamily),
//     );
//   }
// }
