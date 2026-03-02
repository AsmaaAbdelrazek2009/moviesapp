import 'package:flutter/material.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';

import '../../../Models/MoviesList/MoviesList.dart';
import '../../../Widgets/Card.dart';
import '../../../Widgets/TextFiled.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.allmovies});

  final List<Movie> allmovies;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController= TextEditingController();
   List <Movie> FilteredList=[];
  String query = "";
  @override
  void initState() {
    super.initState();
    FilteredList = [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextField1( lableTitle: "Search", icon1: Icon(Icons.search),

                  onChanged: (text) {
                    filterMovies(text);

                },
              ),

              const SizedBox(height: 20),
              Expanded(
                child: query.isEmpty
                    ? Center(child: Image.asset(AppAssets.popCorn))
                    : FilteredList.isEmpty
                    ? const Center(
                  child: Text(
                      "No Movies Found",
                      style: TextStyle(color: Colors.white, fontSize: 18)
                  ),
                )
                    : GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: FilteredList.length,
                  itemBuilder: (context, index) {
                    return Cards(
                      movie: FilteredList[index],
                      heigh: 279,
                      width: 189,
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ) ,
    );
  }

  filterMovies(String selectedWord)
  {
    setState(() {
      query = selectedWord;
      if (selectedWord.isEmpty) {
        FilteredList = [];
      }
      else {
        FilteredList = widget.allmovies.where((movie) {
          return movie.title!.toLowerCase().contains(selectedWord.toLowerCase());
        }).toList();
      }
    });


  }
}
