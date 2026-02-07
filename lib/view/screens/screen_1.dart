import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/widgets/custom_text_form.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/view_model/top_rated_service.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final TopRatedService topRatedService = TopRatedService();

  @override
  void initState() {
    super.initState();
    topRatedService.getTopRatedMovies().then((value) {
      print(value.results.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'What do you want to watch?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.textWhite,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: topRatedService.getTopRatedMovies(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (asyncSnapshot.hasData) {
            final movies = asyncSnapshot.data!.results;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    CustomTextForm(hintText: 'search'),
                    SizedBox(height: 20,),
                    //Text('ListView',style: TextStyle(color: AppColor.textWhite),),
                    SizedBox(
                      height: 450,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                fit: BoxFit.cover,
                                width: 250,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return SizedBox(
                          width: 300,
                          height: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlay: true,
                        viewportFraction: .4,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text('There is an error'));
        },
      ),
    );
  }
}
