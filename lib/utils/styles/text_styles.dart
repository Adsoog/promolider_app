import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/theme/app_colors.dart';

TextStyle ctaButtonStyle({Color? color, double? fontSize}) => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 13.0.sp,
      color: color ?? Colors.white,
    );

TextStyle inputStyle({Color? color, double? fontSize}) => TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 13.0.sp,
      color: color ?? inputColor,
    );

OutlineInputBorder inputOutlineBorder({Color? color}) => OutlineInputBorder(
      borderSide: const BorderSide(
        color: inputColor,
      ),
      borderRadius: BorderRadius.circular(5.r),
    );
