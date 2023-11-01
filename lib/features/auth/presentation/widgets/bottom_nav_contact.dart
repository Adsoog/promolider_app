import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/features/auth/presentation/widgets/custom_dialog_contact.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';

class BottomNavContact extends StatelessWidget {
  const BottomNavContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            TablerIcons.phone,
            color: colors.primary,
          ),
          SizedBox(width: 5.w),
          TextButton(
            onPressed: () async {
              await showGeneralDialog(
                context: context,
                barrierDismissible: false,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const CustomDialogContact(),
              );
            },
            child: Text(
              'Contacto',
              style: ctaButtonStyle(),
            ),
          )
        ],
      ),
    );
  }
}
