import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:promolider_app/shared/widgets/custom_aligment.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';

class BoxIconShadow extends StatelessWidget {
  const BoxIconShadow({
    super.key,
    this.countShadowItems = 2,
    this.alignment = CustomAligment.left,
    required this.icon,
  });

  final int countShadowItems;
  final CustomAligment alignment;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment == CustomAligment.left
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          children: alignment == CustomAligment.left
              ? [
                  ...List.generate(
                    countShadowItems,
                    (index) => ZoomOut(
                      delay: Duration(milliseconds: index * 400),
                      child: const ShadowContainer(),
                    ),
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: countShadowItems * 400),
                    child: icon,
                  ),
                ]
              : [
                  ZoomIn(
                    delay: Duration(milliseconds: countShadowItems * 400),
                    child: icon,
                  ),
                  ...List.generate(
                    countShadowItems,
                    (index) => ZoomOut(
                      delay: Duration(milliseconds: index * 400),
                      child: const ShadowContainer(),
                    ),
                  ),
                ],
        ),
      ],
    );
  }
}
