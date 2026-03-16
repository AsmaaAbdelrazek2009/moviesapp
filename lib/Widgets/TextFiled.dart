import 'package:flutter/material.dart';

import '../Utilites/AppColors.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    super.key,
    required this.lableTitle,
    required this.icon1,
    required this.onChanged,
    this.controller,
    this.icon2,
    this.obscureText=false
  });
  final bool? obscureText;
  final String lableTitle;
  final Icon icon1;
  final IconButton? icon2;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColors.white,
      ),
      decoration: InputDecoration(

        labelText: lableTitle,
        iconColor: AppColors.white,
        prefixIcon: icon1,
        suffixIcon: icon2,
        labelStyle: TextStyle(color: AppColors.white),
        filled: true,
        fillColor: AppColors.black,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
