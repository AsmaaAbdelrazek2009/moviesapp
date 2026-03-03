import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import '../../../Models/UserDataModel/useerDM.dart';
import '../../../Models/UserDataModel/userCollections.dart';
import '../../../Utilites/AppColors.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/TextFiled.dart';
import '../../Navigations/BottomNavBar.dart';
import '../Login/LoginScreen.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key, });
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final NameController = TextEditingController();
  final PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Center(child: Text("Register",style: AppTextStyles.yellowText400mediam16,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.gamer2),
                Spacer(),
                Image.asset(AppAssets.gamer1),
                Spacer(),
                Image.asset(AppAssets.gamer3),
              ],
            ),
            SizedBox(height: 41,),
            TextField1(lableTitle: "Name",icon1: Icon(Icons.person,color: AppColors.white,),onChanged: (value){ }, controller: NameController,),
            SizedBox(height: 24,),
            TextField1(lableTitle: "e-mail",icon1: Icon(Icons.email_outlined,color: AppColors.white,),onChanged: (value){},controller: EmailController,),
            SizedBox(height: 24,),
            TextField1(lableTitle: "Passowrd",icon1: Icon(Icons.lock_outline,color: AppColors.white,),onChanged: (value){},controller: PasswordController,),
            SizedBox(height: 24,),
            TextField1(lableTitle: "Confirm Password",icon1: Icon(Icons.lock_outline,color: AppColors.white,),onChanged: (value){}, controller: PasswordController,),
            SizedBox(height: 24,),
            TextField1(lableTitle: "Phone number",icon1: Icon(Icons.phone,color: AppColors.white,), onChanged: (value){ }, controller: PhoneController,),
            SizedBox(height: 24,),
        buildCreateAccount(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you have already an account ",style: AppTextStyles.whitesubHeader400mediam14,),
                InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text("Login",style: AppTextStyles.yellowText900mediam14,)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppButton buildCreateAccount(BuildContext context) {

    return  AppButton(text: "Create Account",
        color1: AppColors.yellow,
        color2: AppColors.black,
        TextColor:AppColors.black,
        onPressed: () async{
            String Message="";
            try {
              showLoading(context);

              await Future.delayed(Duration(milliseconds: 100));

              final credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: EmailController.text,
                password: PasswordController.text,
              );
              UserDM.currentUser = UserDM(

                id: credential.user!.uid,
                name: NameController.text,
                email: EmailController.text,
                phone: PhoneController.text,
              );
              await MyDatabase.createUserInFirestore(UserDM.currentUser!);
              hideLoading(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
            }
            on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                Message='The password provided is too weak.';
                hideLoading(context);

              }
              else if (e.code == 'email-already-in-use') {
                Message ="The account already exists for that email.";
                hideLoading(context);

              }
              else
              {
                Message="Something worng happened";
                hideLoading(context);

              }
              buildAlertDialoge(Message, context);
            }
            catch (e) {
              print(e);
            }
        });
  }

  void showLoading(context) {

    showDialog(
      context: context,
      barrierDismissible: false, // مش هتقدر تقفلها بالضغط بره
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void hideLoading(context) {
    Navigator.pop(context);

  }

  void buildAlertDialoge(String message, BuildContext context) {

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Erorr"),
      content: Text(message),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: Text("OK"))
      ],
    ),);
  }


}
