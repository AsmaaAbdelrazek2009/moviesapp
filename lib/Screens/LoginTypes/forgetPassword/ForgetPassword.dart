import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';

import '../../../Cupit/AuthCupit.dart';
import '../../../Cupit/States.dart';
import '../../../Utilites/AppColors.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/TextFiled.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>Authcupit(),
      child : BlocConsumer<Authcupit,States>(
        listener: (context,state){

        },
        builder: (context,state){
          return Scaffold(
            backgroundColor: AppColors.black,
            appBar: AppBar(
              backgroundColor: AppColors.black,
              centerTitle: true,
              title: Text("forget Password",style: AppTextStyles.yellowText400mediam16,),
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 20,color: AppColors.yellow,)),
            ),
            body: Column(
              children: [
                Image.asset(AppAssets.ForgetPassword),
                SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField1(icon1: Icon(Icons.email),lableTitle: "e-mail",
                    onChanged: (value){
                    },controller: Authcupit.get(context).EmailController,),
                ),
                SizedBox(height: 24,),
                AppButton(TextColor: AppColors.black,color2: AppColors.yellow,color1: AppColors.yellow
                  ,onPressed: (){
                  Authcupit.get(context).resetPassword(context);
                  }
                  ,text:"Verify e-mail" ,)
              ],
            ),
          );
        }

));
  }


}
