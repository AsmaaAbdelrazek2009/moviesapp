import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Screens/EditProfile/EditProfile.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Button.dart';

import '../../../FirebaseUtilities/userCollections.dart';
import '../../../Models/MovieDetails/MovieDetailsList.dart';
import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Models/UserDataModel/useerDM.dart';
import '../../../Utilites/AppColors.dart';
import '../../../Widgets/Card.dart';
import '../../FilmDetails/FileDetails.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final List<Movie> allmovies;

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
                  buildHistoryList(),
                  buildHistoryList(),
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
  Widget buildHistoryList( ) {
    return StreamBuilder<QuerySnapshot<Movie2>>(
      stream: MyDatabase.getHistoryStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: AppColors.yellow));
        }

        var historyMovies = snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];

        if (historyMovies.isEmpty) {
          return buildEmptyListState();
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          itemCount: historyMovies.length,
          itemBuilder: (context, index) {
            var movie2 = historyMovies[index];
            Movie movieBrief = Movie(
              id: movie2.id,
              title: movie2.title,
              mediumCoverImage: movie2.mediumCoverImage,
              rating: movie2.rating,
            );

            return InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmDetails(movieId: allmovies[index].id!, allmovies: allmovies,)));
              },
              child: Cards(
                movie: movieBrief,
                heigh: 200,
                width: 120,
              ),
            );
          },
        );
      },
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
          StreamBuilder<QuerySnapshot<Movie2>>(
            stream: MyDatabase.getHistoryStream(),
            builder: (context, snapshot) {
              int count = snapshot.hasData ? snapshot.data!.docs.length : 0;
              return buildCounter(count.toString(), "History");
            },
          ),        ],
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