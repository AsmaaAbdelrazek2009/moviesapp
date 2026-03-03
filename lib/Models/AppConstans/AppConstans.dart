
import 'package:moviesapp/Utilites/AppAssets.dart';

class AvailableNow{
  String imgPath;
  String rate;

  AvailableNow({
    required this.imgPath,
    required this.rate,
  });
}

List <AvailableNow> AvailableNowList=[
  AvailableNow(imgPath: AppAssets.onBoarding1, rate: "4.6"),
AvailableNow(imgPath: AppAssets.Expolorenow, rate: "4.6"),
AvailableNow(imgPath: AppAssets.onBoarding4, rate: "4.6")
];

List <String> AvatarPicker=[
  AppAssets.gamer1,
  AppAssets.gamer2,
  AppAssets.gamer3,
  AppAssets.gamer4,
  AppAssets.gamer5,
  AppAssets.gamer6,
  AppAssets.gamer7,
  AppAssets.gamer8,
  AppAssets.gamer9,
  AppAssets.gamer10,

];


