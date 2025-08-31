import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;
  final bool uppercase;
  final bool softWrap;
  final TextDecoration? decoration;

  const AppText(
    this.text, {
    Key? key,
    this.textAlign,
    this.style,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.height,
    this.uppercase = false,
    this.softWrap = true,
    this.decoration,
  }) : super(key: key);

  factory AppText.heading(
    String text, {
    double? size,
    Color? color,
    FontWeight? weight = FontWeight.w700,
    TextAlign? align,
    int? maxLines,
  }) {
    return AppText(
      text,
      fontSize: size?.sp ?? 20.sp,
      color: color,
      fontWeight: weight,
      textAlign: align,
      maxLines: maxLines,
    );
  }

  factory AppText.subtitle(
    String text, {
    double? size,
    Color? color,
    FontWeight? weight = FontWeight.w600,
    TextAlign? align,
    int? maxLines,
  }) {
    return AppText(
      text,
      fontSize: size?.sp ?? 14.sp,
      color: color,
      fontWeight: weight,
      textAlign: align,
      maxLines: maxLines,
    );
  }

  factory AppText.smalltitle(
    String text, {
    double? size,
    Color? color,
    FontWeight? weight = FontWeight.w600,
    TextAlign? align,
    int? maxLines,
  }) {
    return AppText(
      text,
      fontSize: size?.sp ?? 12.sp,
      color: color,
      fontWeight: weight,
      textAlign: align,
      maxLines: maxLines,
    );
  }
  factory AppText.verysmalltitle(
    String text, {
    double? size,
    Color? color,
    FontWeight? weight = FontWeight.w600,
    TextAlign? align,
    int? maxLines,
  }) {
    return AppText(
      text,
      fontSize: size?.sp ?? 10.sp,
      color: color,
      fontWeight: weight,
      textAlign: align,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle base =
        Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    TextStyle merged = base.merge(style);

    if (fontSize != null) merged = merged.copyWith(fontSize: fontSize);
    if (color != null) merged = merged.copyWith(color: color);
    if (fontWeight != null) merged = merged.copyWith(fontWeight: fontWeight);
    if (letterSpacing != null)
      merged = merged.copyWith(letterSpacing: letterSpacing);
    if (height != null) merged = merged.copyWith(height: height);
    if (decoration != null) merged = merged.copyWith(decoration: decoration);

    return Text(
      uppercase ? text.toUpperCase() : text,
      textAlign: textAlign,
      style: merged,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
