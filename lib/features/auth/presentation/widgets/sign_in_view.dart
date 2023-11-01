import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';
import 'package:promolider_app/features/auth/presentation/widgets/widgets.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';
import 'package:promolider_app/utils/images/app_images.dart';
import 'package:promolider_app/utils/providers/social_media_links.dart';
import 'package:promolider_app/utils/router/router_utils.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';
import 'package:promolider_app/utils/validators/ext_input_validator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = context.watch<SignInScreenProvider>();
    final authProvider = context.watch<AuthRepositoryProvider>();
    final initialProvider = context.read<InitialScreenProvider>();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 0.17.sh),
          Image.asset(
            AppImages.logoImg,
            width: 0.55.sw,
          ),
          SizedBox(height: 0.05.sh),
          Form(
            key: signInProvider.signInFormKey,
            child: Column(
              children: [
                ZoomIn(
                  child: authProvider.errorText.isNotEmpty
                      ? CustomErrorWidget(error: authProvider.errorText)
                      : SizedBox(width: 0.8.sw, height: 40.h),
                ),
                SizedBox(height: 0.02.sh),
                CustomInput(
                  hintText: 'Usuario',
                  icon: TablerIcons.user,
                  controller: signInProvider.userController,
                  validator: (val) {
                    return val == null || !val.isValidName ? '' : null;
                  },
                ),
                SizedBox(height: 0.02.sh),
                CustomInput(
                  hintText: 'Contraseña',
                  icon: TablerIcons.lock,
                  isPassword: true,
                  controller: signInProvider.passwordController,
                  validator: (val) {
                    return val == null || !val.isValidName ? '' : null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 0.02.sh),
          SizedBox(
            width: 0.8.sw,
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: signInProvider.isRemember,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Recordar datos',
                      style: inputStyle(fontSize: 12.sp),
                    ),
                    onChanged: (_) => signInProvider.rememberData =
                        !signInProvider.isRemember,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const CustomDialogRecoverPassword(),
                    );
                  },
                  child: Text(
                    'Olvidé mi contraseña',
                    style: ctaButtonStyle(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.02.sh),
          CtaButton(
            onPressed: () async {
              signInProvider.validateForm();
              final bool response = await authProvider.signIn(
                username: signInProvider.userController.text,
                password: signInProvider.passwordController.text,
                isFromPrefs: false,
              );
              if (response && context.mounted) {
                context.goNamed(AppRoutes.home.routeName);
                if (signInProvider.isRemember) {
                  await initialProvider.saveUserDataOnPrefs(
                    username: signInProvider.userController.text,
                    password: signInProvider.passwordController.text,
                  );
                }
              }
            },
            // width: 0.5.sw,
            title: 'Iniciar sesión',
          ),
          SizedBox(height: 0.17.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Síguenos en: ', style: inputStyle()),
              ...socialMediaData.map(
                (buttonData) => SocialMediaCircle(
                  icon: buttonData.icon,
                  ontap: () async {
                    if (!await launchUrl(buttonData.url)) {}
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
