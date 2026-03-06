import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import '../../../Models/UserDataModel/useerDM.dart';
import '../../../FirebaseUtilities/userCollections.dart';
import '../../../Utilites/AppColors.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/TextFiled.dart';
import '../../Navigations/BottomNavBar.dart';
import '../Signup/SignupScreen.dart';
import '../forgetPassword/ForgetPassword.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final TextEditingController EmailController=TextEditingController();

  final TextEditingController PasswordController=TextEditingController();

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

            TextField1(lableTitle: "e-mail",icon1: Icon(Icons.email_outlined,color: AppColors.white,),onChanged: (value){}, controller: EmailController),
            SizedBox(height: 24,),
            TextField1(lableTitle: "Passowrd",icon1: Icon(Icons.lock_outline,color: AppColors.white,),onChanged: (value){}, controller: PasswordController),
            SizedBox(height: 24,),
          Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                  },
                  child: Text("Forget Password ?",style: AppTextStyles.yellowText400mediam14,))),
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
            buildLoginSingupNormally( context),
            Divider(),
            Text("OR",style: AppTextStyles.yellowText400mediam14,),
            AppButton(text: "Login with Google", color1: AppColors.yellow,color2: AppColors.black,TextColor:AppColors.black , onPressed: () {}),
          ],
        ),
      ),
    );
  }

   AppButton buildLoginSingupNormally(BuildContext context) {
     return AppButton(
       text: "Login", color1: AppColors.yellow,color2: AppColors.black,TextColor:AppColors.black ,
       onPressed: ()

     async{
       String Message="";
       try {
         showLoading(context);

         await Future.delayed(Duration(milliseconds: 100));

         final credential = await FirebaseAuth.instance
             .signInWithEmailAndPassword(
           email: EmailController.text,
           password: PasswordController.text,
         );

         UserDM.currentUser = await MyDatabase.getUserFromFireStore(credential.user!.uid);
         hideLoading(context);
         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
       }
       on FirebaseAuthException catch (e) {

         if (e.code == 'user-not-found') {
           Message='No user found for that email.';
           hideLoading(context);

         } else if (e.code == 'wrong-password') {
           Message='Wrong password provided for that user.';
           hideLoading(context);

         }
         buildAlertDialoge(Message,context );
         // hideLoading(context);

       }
       catch (e) {
         print(e);
         hideLoading(context);

       }
     },
     );

   }

   void showLoading(BuildContext context) {
     showDialog(
       context: context,
       // barrierDismissible: false, // مش هتقدر تقفلها بالضغط بره
       builder: (context) => Center(
         child: CircularProgressIndicator(),
       ),
     );
   }

   void hideLoading(BuildContext context) {
     Navigator.pop(context); // تقفل الـ dialog
   }

void buildAlertDialoge(String message, BuildContext context) { // إضافة context هنا
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
      ],
    ),
  );
}
}
