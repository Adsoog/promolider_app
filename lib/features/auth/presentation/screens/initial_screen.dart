import 'package:flutter/material.dart';
import 'package:promolider_app/features/auth/presentation/widgets/widgets.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InitialView(),
    );
  }
}
