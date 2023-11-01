import 'package:flutter/material.dart';

class SignInScreenProvider extends ChangeNotifier {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInFormKey = GlobalKey();
  bool _isRemember = false;
  bool _isValidForm = false;

  TextEditingController get userController => _userController;
  TextEditingController get passwordController => _passwordController;
  bool get isRemember => _isRemember;
  GlobalKey get signInFormKey => _signInFormKey;
  bool get isValidForm => _isValidForm;

  void validateForm() async {
    isValidForm = _signInFormKey.currentState?.validate() ?? false;

    isValidForm =
        userController.text.isNotEmpty && passwordController.text.isNotEmpty;

    if (isValidForm) {
      _signInFormKey.currentState?.save();
    }
  }

  set rememberData(bool isRememberData) {
    _isRemember = isRememberData;
    notifyListeners();
  }

  set isValidForm(bool isValidForm) {
    _isValidForm = isValidForm;
    notifyListeners();
  }

  @override
  void dispose() {
    _userController.clear();
    _passwordController.clear();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
