
import 'package:flutter_bloc/flutter_bloc.dart';

import '../FirebaseUtilities/userCollections.dart';
import '../Models/MovieDetails/MovieDetailsList.dart';
import 'States.dart';

class ProfileCupit extends Cubit <States>{
  ProfileCupit() : super (MovieInitialState());
  static ProfileCupit get (context)=>BlocProvider.of(context);

  List<Movie2> watchList = [];
  List<Movie2> historyList = [];

  void getProfileData() {
    emit(ProfileLoadingState());

    try {
      MyDatabase.getWatchListStream().listen((watchSnapshot) {
        watchList = watchSnapshot.docs.map((doc) => doc.data()).toList();

        MyDatabase.getHistoryStream().listen((historySnapshot) {
          historyList = historySnapshot.docs.map((doc) => doc.data()).toList();
          emit(ProfileSuccessState(watchList, historyList));
        });
      });
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  Future<void> logout() async {
    await MyDatabase.logout();
    emit(MovieInitialState());
  }
}