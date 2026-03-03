import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class Authcupit extends Cubit <States>{
  Authcupit() : super (MovieInitialState());

  final TextEditingController EmailController=TextEditingController();

  static Authcupit get (context)=>BlocProvider.of(context);

  Future <void> resetPassword(context) async{

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: EmailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password sent in your email")));
      emit(ForgetPasswordState());
    }
    catch(e){
      print("error");
    }
  }


}