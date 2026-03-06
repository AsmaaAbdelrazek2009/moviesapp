import 'package:flutter/material.dart';
import 'package:moviesapp/Screens/EditProfile/EditProfile.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Button.dart';

import '../../../Models/UserDataModel/useerDM.dart';
import '../../../Utilites/AppColors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.Grey),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(UserDM.currentUser!.imgPath!, height: 118),
                          SizedBox(height: 16),
                          Text(
                            UserDM.currentUser!.name!,
                            style: AppTextStyles.whiteHeader700mediam20,
                          ),
                        ],
                      ),
                      Spacer(),

                      Column(
                        children: [
                          Text(
                            "12",
                            style: AppTextStyles.whiteHeader700mediam20,
                          ),
                          Text(
                            "Watch List",
                            style: AppTextStyles.whiteHeader700mediam20,
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            "12",
                            style: AppTextStyles.whiteHeader700mediam20,
                          ),
                          Text(
                            "History",
                            style: AppTextStyles.whiteHeader700mediam20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));

                        },
                        text: "Edit Profile",
                        color1: AppColors.yellow,
                        color2: AppColors.yellow,
                        TextColor: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: AppButton(
                        onPressed: () {},
                        text: "Exit",
                        color1: AppColors.red,
                        color2: AppColors.red,
                        TextColor: AppColors.white,
                        Icons: Icon(
                          Icons.exit_to_app_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 87.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.table_rows_rounded,
                            color: AppColors.yellow,
                            size: 42,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Watch List",
                            style: AppTextStyles.whitesubHeader400mediam20,
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.folder, color: AppColors.yellow, size: 42),
                          SizedBox(height: 16),
                          Text(
                            "History",
                            style: AppTextStyles.whitesubHeader400mediam20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 179,),
          Image.asset(AppAssets.popCorn),
        ],
      ),
    );
  }
}
