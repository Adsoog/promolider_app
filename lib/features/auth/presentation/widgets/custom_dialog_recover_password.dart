import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';
import 'package:promolider_app/utils/images/app_images.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';
import 'package:provider/provider.dart';

class CustomDialogRecoverPassword extends StatelessWidget {
  const CustomDialogRecoverPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthRepositoryProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: REdgeInsets.all(24),
        child: Center(
          child: Container(
            width: 1.sw,
            height: 0.5.sh,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Image.asset(
                  AppImages.iconRecoverPasswordImg,
                  width: 60.h,
                  height: 60.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: ctaButtonStyle(color: backgroundColor),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Introduce tu email con el que te\nregistraste y enseguida te\nenviaremos un correo para el\ncambio de clave',
                  textAlign: TextAlign.center,
                  style: inputStyle(color: backgroundColor),
                ),
                SizedBox(height: 20.h),
                CustomInput(
                  hintText: 'Correo electrónico',
                  icon: TablerIcons.mail,
                  controller: authProvider.emailRecoverController,
                ),
                SizedBox(height: 10.h),
                CtaButton(
                  onPressed: () async {
                    await authProvider.recoverPassword();
                  },
                  title: 'Recuperar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
