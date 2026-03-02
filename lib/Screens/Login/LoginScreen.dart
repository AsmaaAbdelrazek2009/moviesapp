import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../../Utilites/AppColors.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/TextFiled.dart';
import '../Signup/SignupScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [

            Center(child: Image.asset(AppAssets.logo)),
            SizedBox(height: 41,),

            // TextField1(lableTitle: "e-mail",icon1: Icon(Icons.email_outlined,color: AppColors.white,),onChanged: (){},),
            // SizedBox(height: 24,),
            // TextField1(lableTitle: "Passowrd",icon1: Icon(Icons.lock_outline,color: AppColors.white,),onChanged: (){},),
            // SizedBox(height: 24,),
          Align(
              alignment: Alignment.topRight,
              child: Text("Forget Password ?",style: AppTextStyles.yellowText400mediam14,)),
            SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: AppTextStyles.whitesubHeader400mediam14,),
                  InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      },
                      child: Text("Create One",style: AppTextStyles.yellowText900mediam14,)),
                ],
              ),

            AppButton(text: "Login", color1: AppColors.yellow,color2: AppColors.black,TextColor:AppColors.black , onPressed: () {}),
            Divider(),
            Text("OR",style: AppTextStyles.yellowText400mediam14,),
            AppButton(text: "Login with Google", color1: AppColors.yellow,color2: AppColors.black,TextColor:AppColors.black , onPressed: () {}),

          ],
        ),
      ),
    );
  }
}
