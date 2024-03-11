import 'package:flutter/material.dart';

import '../appstyle.dart';
import '../color.dart';

class WaText extends StatelessWidget {
  final String? text;
  final List<TextSpan>? textSpans;
  final TextStyle? style;
  final bool baskerville;
  final Alignment? textAlignment;
  final int? maxLines;
  final Color? textcolor;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontsize;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final bool underline;
  final bool showRedStar;
  final int? maxCharactersToShow;

  const WaText(
    this.text, {
    Key? key,
    this.textSpans,
    this.style,
    this.textAlignment,
    this.maxLines,
    this.overflow,
    this.textcolor,
    this.baskerville = false,
    this.fontWeight,
    this.fontsize,
    this.fontStyle,
    this.textAlign,
    this.underline = false,
    this.showRedStar = false,
    this.maxCharactersToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String truncatedText = text ?? '';
    if (maxCharactersToShow != null && truncatedText.length > maxCharactersToShow!) {
      truncatedText = '${truncatedText.substring(0, maxCharactersToShow!)}...';
    }
    return Align(
      alignment: textAlignment ?? Alignment.center,
      child: RichText(
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
        text: TextSpan(
          text: truncatedText,
          style: TextStyle(
            fontSize: fontsize ?? 18.0,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: textcolor ?? AppColors.blackColor,
            fontFamily: baskerville ? AppStyles.libreBaskerville.fontFamily : AppStyles.inter.fontFamily,
            decoration: underline ? TextDecoration.underline : null,
          ).merge(style),
          children: [
            if (showRedStar)
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: fontsize ?? 18.0,
                ),
              ),
            ...(textSpans ?? []),
          ],
        ),
      ),
    );
  }
}
