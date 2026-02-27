
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