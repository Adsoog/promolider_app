import 'package:flutter/material.dart';
import 'package:promolider_app/features/auth/presentation/widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInView(),
      bottomNavigationBar: BottomNavContact(),
    );
  }
}
