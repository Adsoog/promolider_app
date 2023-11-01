import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';

class BoxIcon extends StatelessWidget {
  const BoxIcon({
    super.key,
    required this.onPressed,
    this.icon,
    this.image,
    required this.title,
  });

  final VoidCallback onPressed;
  final IconData? icon;
  final Image? image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 60.h,
          width: 60.h,
          child: IconButton(
            onPressed: onPressed,
            icon: icon != null
                ? Icon(icon!, size: 40.sp, color: Colors.white)
                : image!,
            style: ButtonStyle(
              overlayColor: const MaterialStatePropertyAll(hoverColor),
              backgroundColor: MaterialStatePropertyAll(colors.primary),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          title,
          style: ctaButtonStyle(fontSize: 12.sp),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
