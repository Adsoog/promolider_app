import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/theme/app_colors.dart';

class SocialMediaCircle extends StatelessWidget {
  const SocialMediaCircle({
    super.key,
    required this.icon,
    required this.ontap,
  });
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: ClipOval(
        child: Material(
          color: colors.primary, // Button color
          child: InkWell(
            splashColor: hoverColor, // Splash color
            onTap: ontap,
            child: SizedBox(
              width: 25.w,
              height: 25.w,
              child: Icon(icon, color: colors.background),
            ),
          ),
        ),
      ),
    );
  }
}
