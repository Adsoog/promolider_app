import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';
import 'package:promolider_app/shared/widgets/custom_aligment.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';
import 'package:promolider_app/utils/images/app_images.dart';
import 'package:promolider_app/utils/router/router_utils.dart';
import 'package:provider/provider.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final initialProvider = context.watch<InitialScreenProvider>();

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0.2.sh),
            Image.asset(
              AppImages.logoImg,
              width: 0.8.sw,
            ),
            SizedBox(height: 0.05.sh),
            CtaButton(
              onPressed: () async {
                await initialProvider.signInExistsUser(
                  context,
                  AppRoutes.home.routeName,
                );
              },
            ),
            SizedBox(height: 0.1.sh),
            BoxIconShadow(
              countShadowItems: 4,
              icon: BoxIcon(
                onPressed: () async {
                  initialProvider.selectedOption = InitialOptions.binaryTree;
                  await initialProvider.signInExistsUser(
                    context,
                    AppRoutes.home.routeName,
                  );
                },
                image: Image.asset(AppImages.binaryTreeImg),
                title: 'Árbol\nBinario',
              ),
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                BoxIconShadow(
                  icon: BoxIcon(
                    onPressed: () async {
                      initialProvider.selectedOption = InitialOptions.myWallet;
                      await initialProvider.signInExistsUser(
                        context,
                        AppRoutes.home.routeName,
                      );
                    },
                    icon: TablerIcons.wallet,
                    title: 'Mi\nBilletera',
                  ),
                ),
                const Spacer(),
                BoxIconShadow(
                  alignment: CustomAligment.right,
                  icon: BoxIcon(
                    onPressed: () async {
                      initialProvider.selectedOption = InitialOptions.shareLink;
                      await initialProvider.signInExistsUser(
                        context,
                        AppRoutes.home.routeName,
                      );
                    },
                    icon: TablerIcons.share_3,
                    title: 'Compartir\nenlace',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
