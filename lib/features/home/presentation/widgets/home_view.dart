import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/config/theme/app_colors.dart';
import 'package:promolider_app/features/home/presentation/utils/enum_segmented_leg.dart';
import 'package:promolider_app/shared/widgets/cta_button.dart';
import 'package:promolider_app/utils/images/app_images.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 600,
            child: Stack(
              alignment: Alignment.topCenter,
              //fit: StackFit.expand,
              children: [
                Column(
                  children: [
                    Container(
                      height: 110,
                      color: Colors.black,
                      // child: SizedBox(
                      //   height: 110,
                      // ),
                    ),
                    Container(
                      height: 370.h,
                      child: Image.asset(
                        AppImages.homeBg,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CommonContainer(
                      //height: 90.h,
                      height: 119.0.h,
                      //width: 0.56.sw,
                      width: 200.0.w,
                      margin: EdgeInsets.only(right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajuste de pierna',
                            style: ctaButtonStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.center,
                            child: SegmentedButton(
                              segments: const [
                                ButtonSegment(
                                  value: SegmentedLeg.left,
                                  icon: Text(
                                    'Izquierda',
                                  ),
                                ),
                                ButtonSegment(
                                  value: SegmentedLeg.right,
                                  icon: Text(
                                    'Derecha',
                                  ),
                                ),
                              ],
                              selected: const <SegmentedLeg>{SegmentedLeg.left},
                              onSelectionChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    _CommonContainer(
                      //height: 90.h,
                      height: 119.0.h,
                      //width: 0.4.sw,
                      width: 141.0.w,
                      margin: EdgeInsets.only(right: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Condición',
                            style: ctaButtonStyle(color: Colors.black),
                          ),
                          const ConditionItem(
                            title: 'Membresía activa:',
                            isChecked: true,
                          ),
                          const ConditionItem(
                            title: 'OPC activo:',
                            isChecked: false,
                          ),
                          const ConditionItem(
                            title: 'Calificado:',
                            isChecked: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  //top: 95.h,
                  top: 130.h,
                  child: _CommonContainer(
                    //height: 163.h,
                    height: 260.h,
                    width: 1.sw,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indicadores de resumen mensual',
                          style: ctaButtonStyle(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono de expansión',
                              bgColor: Colors.green.shade100,
                              icon: AppImages.expansionBonus,
                            ),
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono Binario',
                              bgColor: Colors.lightBlue.shade100,
                              icon: AppImages.binaryBonus,
                            ),
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono\ngeneracional',
                              bgColor: Colors.blue.shade100,
                              icon: AppImages.generationalBonus,
                            ),
                          ],
                        ),
                        Text(
                          'Indicadores acumulativos',
                          style: ctaButtonStyle(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono de efectivo rápido',
                              bgColor: Colors.red.shade100,
                              icon: AppImages.cashBonus,
                            ),
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono de Productor',
                              bgColor: Colors.red.shade100,
                              icon: AppImages.producerBonus,
                            ),
                            MonthIndicatorItem(
                              money: 0.0,
                              title: 'Bono por venta de curso',
                              bgColor: Colors.green.shade100,
                              icon: AppImages.courseSalesBonus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Árbol binario",
                  style: ctaButtonStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Positioned(
            top: 300.h,
            left: 50.w,
            child: ArbolBinario(),
          ),
          Row(
            children: [
              CtaButton(
                  width: 0.5.sw,
                  title: "Volumen Izquierdo",
                  onPressed: () => {}),
              SizedBox(
                width: 10.0,
              ),
              CtaButton(
                width: 0.5.sw,
                title: "Volumen Derecho",
                onPressed: () => {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class MonthIndicatorItem extends StatelessWidget {
  const MonthIndicatorItem({
    super.key,
    required this.money,
    required this.title,
    required this.bgColor,
    required this.icon,
  });

  final double money;
  final String title;
  final Color bgColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.h,
          height: 24.h,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: REdgeInsets.all(3.0),
            child: Image.asset(
              icon,
            ),
          ),
        ),
        Container(
          width: 60.w,
          margin: EdgeInsets.only(left: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$ $money',
                style: ctaButtonStyle(color: backgroundColor),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ConditionItem extends StatelessWidget {
  const ConditionItem({
    super.key,
    required this.title,
    required this.isChecked,
  });

  final String title;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(title)),
        Container(
          decoration: BoxDecoration(
            color: isChecked ? colors.primary : Colors.red,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            isChecked ? TablerIcons.check : TablerIcons.x,
            // size: 15.sp,
          ),
        ),
      ],
    );
  }
}

class _CommonContainer extends StatelessWidget {
  const _CommonContainer({
    required this.height,
    required this.width,
    required this.margin,
    required this.child,
  });

  final double height;
  final double width;
  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

class ArbolBinario extends StatelessWidget {
  const ArbolBinario({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(300, 300),
          //painter: ArrowPainter(),
        ),
        // Nivel 1
        Positioned(
          top: 0,
          left: 125,
          child: nodeWidget('https://link-to-image.com/image.jpg'),
        ),
        // Nivel 2 - Izquierda
        Positioned(
          top: 100,
          left: 50,
          child: nodeWidget('https://link-to-image.com/image2.jpg'),
        ),
        // Nivel 2 - Derecha
        Positioned(
          top: 100,
          right: 50,
          child: nodeWidget('https://link-to-image.com/image3.jpg'),
        ),
        // Nivel 3 - Izquierda 1
        Positioned(
          top: 200,
          left: 0,
          child: nodeWidget('https://link-to-image.com/image4.jpg'),
        ),
        // Nivel 3 - Izquierda 2
        Positioned(
          top: 200,
          left: 85,
          child: nodeWidget('https://link-to-image.com/image5.jpg'),
        ),
        // Nivel 3 - Derecha 1
        Positioned(
          top: 200,
          right: 85,
          child: nodeWidget('https://link-to-image.com/image6.jpg'),
        ),
        // Nivel 3 - Derecha 2
        Positioned(
          top: 200,
          right: 0,
          child: nodeWidget('https://link-to-image.com/image7.jpg'),
        ),
      ],
    );
  }

  Widget nodeWidget(String imageUrl) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    canvas.drawLine(Offset(size.width / 2, 60), Offset(60, 140), paint);
    canvas.drawLine(
        Offset(size.width / 2, 60), Offset(size.width - 60, 140), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
