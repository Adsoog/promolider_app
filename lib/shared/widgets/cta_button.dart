import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';

class CtaButton extends StatelessWidget {
  const CtaButton({
    super.key,
    this.title = 'Ingresar',
    this.width,
    this.height,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final double? height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.7.sw,
      height: height ?? 40.h,
      child: FilledButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(hoverColor),
        ),
        child: Text(
          title,
          style: ctaButtonStyle(),
        ),
      ),
    );
  }
}
