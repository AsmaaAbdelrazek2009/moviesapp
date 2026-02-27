import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/Models/AppConstans/AppConstans.dart';

import '../../Widgets/Card.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  List <AvailableNow> availableNowList=AvailableNowList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          buildAvailableNowList(context),
          buildWatchNowList(context),
        ],
      )

    );
  }

  Widget buildAvailableNowList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 114.0),
      child: CarouselSlider(items: availableNowList.map((index)=>Cards(availableNow: index ,)).toList(), options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.38,
        aspectRatio: 16 / 9,
        viewportFraction: 0.5,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),),
    );
  }

  buildWatchNowList(BuildContext context) {

    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(14),


          itemCount: availableNowList.length,
          itemBuilder: (context,index){
            return Cards(availableNow: availableNowList[index],);
          },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 14,);
      },),
    );
  }
}
