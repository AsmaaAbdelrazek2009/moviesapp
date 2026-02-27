import 'package:flutter/material.dart';

import '../Utilites/AppColors.dart';

class TextField1 extends StatelessWidget {
  const TextField1({super.key,required this.lableTitle, required this.icon1});
final String lableTitle;
final Icon icon1;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(
        labelText: lableTitle,
        iconColor: AppColors.white,
        prefixIcon: icon1,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide( width: 1))
      )
    );
  }
}
