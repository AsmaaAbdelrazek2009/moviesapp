import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/Screens/EditProfile/EditProfile.dart';
import 'package:moviesapp/Screens/LoginTypes/Login/LoginScreen.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import 'package:moviesapp/Widgets/Button.dart';
import '../../../Cupit/MovieCupit.dart';
import '../../../Cupit/ProfileCupit.dart';
import '../../../Cupit/States.dart';
import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Models/UserDataModel/useerDM.dart';
import '../../../Utilites/AppColors.dart';
import '../../../Widgets/Card.dart';
import '../../FilmDetails/FileDetails.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCupit()..getProfileData(),
      child: BlocConsumer<ProfileCupit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileCupit.get(context);

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppColors.black,
              body: Column(
                children: [

                  Container(
                    decoration: const BoxDecoration(color: AppColors.Grey),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        buildUserInfoSection(cubit),
                        buildActionButtons(context, cubit),
                        const SizedBox(height: 16),
                        buildTabBar(),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),


                  Expanded(
                    child: state is ProfileLoadingState
                        ? const Center(child: CircularProgressIndicator(color: AppColors.yellow))
                        : TabBarView(
                      children: [
                        buildMoviesGrid(cubit.watchList),
                        buildMoviesGrid(cubit.historyList),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget buildMoviesGrid(List movies) {
    if (movies.isEmpty) return buildEmptyListState();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.65,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var m2 = movies[index];
        Movie movieBrief = Movie(
          id: m2.id,
          title: m2.title,
          mediumCoverImage: m2.mediumCoverImage,
          rating: m2.rating,
        );

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilmDetails(movieId: m2.id!, allmovies: []),
              ),
            );
          },
          child: Cards(
            movie: movieBrief,
            heigh: 200,
            width: 120,
          ),
        );
      },
    );
  }

  Widget buildUserInfoSection(ProfileCupit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(UserDM.currentUser?.imgPath ?? AppAssets.popCorn, height: 118),
              const SizedBox(height: 16),
              Text(
                UserDM.currentUser?.name ?? "User",
                style: AppTextStyles.whiteHeader700mediam20,
              ),
            ],
          ),
          const Spacer(),
          buildCounter(cubit.watchList.length.toString(), "Watch List"),
          const Spacer(),
          buildCounter(cubit.historyList.length.toString(), "History"),
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


  Widget buildActionButtons(BuildContext context, ProfileCupit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              ),
              text: "Edit Profile",
              color1: AppColors.yellow,
              color2: AppColors.yellow,
              TextColor: AppColors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: AppButton(
              onPressed: () async {
                await cubit.logout();
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                  );
                }
              },
              text: "Exit",
              color1: AppColors.red,
              color2: AppColors.red,
              TextColor: AppColors.white,
              Icons: const Icon(Icons.exit_to_app_outlined, color: AppColors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }


  TabBar buildTabBar() {
    return const TabBar(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.yellow,
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.white,
      tabs: [
        Tab(icon: Icon(Icons.table_rows_rounded), text: "Watch List"),
        Tab(icon: Icon(Icons.folder), text: "History"),
      ],
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
}