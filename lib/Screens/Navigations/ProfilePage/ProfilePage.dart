import 'package:flutter/material.dart';
import 'package:moviesapp/Screens/EditProfile/EditProfile.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Button.dart';

import '../../../Models/UserDataModel/useerDM.dart';
import '../../../Utilites/AppColors.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.Grey),
              child: Column(
                children: [
                  buildUserInfoSection(),
                  buildActionButtons(context),
                  const SizedBox(height: 16),

                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelColor: AppColors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                      Tab(icon: Icon(Icons.table_rows_rounded), text: "Watch List"),
                      Tab(icon: Icon(Icons.folder), text: "History"),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  buildEmptyListState(),
                  buildEmptyListState(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyListState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.popCorn),
        const SizedBox(height: 16),
        Text("No Movies Added Yet", style: AppTextStyles.whiteHeader700mediam20),
      ],
    );
  }

  Widget buildUserInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(UserDM.currentUser!.imgPath!, height: 118),
              const SizedBox(height: 16),
              Text(UserDM.currentUser!.name!, style: AppTextStyles.whiteHeader700mediam20),
            ],
          ),
          const Spacer(),
          buildCounter("12", "Watch List"),
          const Spacer(),
          buildCounter("12", "History"),
        ],
      ),
    );
  }

  Widget buildCounter(String count, String label) {
    return Column(
      children: [
        Text(count, style: AppTextStyles.whiteHeader700mediam20),
        Text(label, style: AppTextStyles.whiteHeader700mediam20),
      ],
    );
  }

  Widget buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: AppButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfile())),
            text: "Edit Profile",
            color1: AppColors.yellow, color2: AppColors.yellow, TextColor: AppColors.black,
          ),
        ),
        Expanded(
          flex: 1,
          child: AppButton(
            onPressed: () {},
            text: "Exit",
            color1: AppColors.red, color2: AppColors.red, TextColor: AppColors.white,
            Icons: const Icon(Icons.exit_to_app_outlined, color: AppColors.white, size: 20),
          ),
        ),
      ],
    );
  }
}