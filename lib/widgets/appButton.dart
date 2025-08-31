import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final List<Color> gradientColors;
  final double height;
  final double? width;
  final TextStyle? textStyle;
  final Color? borderColor;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 10,
    this.gradientColors = const [Color(0xFFFFD539), Color(0xFFFFD539),
    ],
    this.height = 55,
    this.width,
    this.textStyle, this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style:
              textStyle ??
               TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
