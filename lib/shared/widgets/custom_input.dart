import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/utils/styles/text_styles.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 0.8.sw,
      child: TextFormField(
        style: inputStyle(),
        obscureText: obscureText,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: inputStyle(),
          labelStyle: inputStyle(),
          border: inputOutlineBorder(),
          enabledBorder: inputOutlineBorder(),
          focusedBorder: inputOutlineBorder(),
          errorBorder: inputOutlineBorder(),
          errorStyle: const TextStyle(height: 0),
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? TablerIcons.eye : TablerIcons.eye_closed,
                  ),
                  onPressed: changeObscureText,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
