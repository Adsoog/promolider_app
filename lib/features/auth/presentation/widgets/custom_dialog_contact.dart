import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialogContact extends StatelessWidget {
  const CustomDialogContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: REdgeInsets.all(24.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoxAlert(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                child: Text(
                  'Llamar al',
                  style: ctaButtonStyle(color: textButtonColor),
                ),
              ),
              BoxAlert(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
                showBorder: true,
                child: TextButton(
                  onPressed: () async {
                    if (!await launchUrl(
                      Uri(scheme: 'tel', path: Uri.parse('(01) 483 3997').path),
                    )) {}
                  },
                  child: Text(
                    '(01) 483 3997',
                    style: ctaButtonStyle(color: textButtonColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxAlert extends StatelessWidget {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;
  final bool showBorder;
  final Widget child;

  const BoxAlert({
    super.key,
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.showBorder = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 0.07.sh,
      width: 0.7.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: topLeft,
          topRight: topRight,
          bottomLeft: bottomLeft,
          bottomRight: bottomRight,
        ),
        color: Colors.white,
        border: Border.all(
          color: showBorder ? colors.background : Colors.white,
        ),
      ),
      child: Center(child: child),
    );
  }
}
