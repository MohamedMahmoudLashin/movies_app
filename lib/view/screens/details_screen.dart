import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';
import 'package:movies/view/widgets/movie_name_title.dart';
import 'package:movies/view/widgets/text_details.dart';
import 'package:movies/view_model/search_movie_cubit.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: CustomAppBar(
        toolTipMessage: 'Add to Whistle',
        angle: 0,
        title: 'Details',
        sufIcon: Icon(
          Icons.library_add_check_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<SearchMovieCubit, SearchMovieState>(
        builder: (context, state) {
          if (state is SearchMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchMovieSuccess) {
            final searchMovie = state.searchMovie.results;
            int index = 0;
            final searchS = searchMovie[index];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.vertical(
                          bottom: Radius.circular(25),),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${searchS.posterPath}",
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 30,
                        bottom: -80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${searchS.posterPath}",
                            height: 170,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 15,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColor.contColor,
                            borderRadius: BorderRadius.circular(8),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star_border_purple500_outlined,
                                  color: AppColor.yellowStar,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0,right: 4),
                                child: Text(searchS.voteAverage.toString(),style: TextStyle(fontSize:12,fontWeight: FontWeight.w600,letterSpacing: .12,color: AppColor.yellowStar),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  MovieNameTitle(
                    movieName: searchS.originalTitle,
                    movieTime: searchS.releaseDate,
                    movieYear: searchS.releaseDate,
                    movieType: searchS.voteAverage.toString(),
                  ),
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelPadding: EdgeInsets.symmetric(horizontal: 20),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          isScrollable: true,
                          dividerColor: AppColor.backGround,
                            unselectedLabelColor: AppColor.iconHint,
                            indicatorWeight: 5,
                            labelColor: AppColor.textWhite,
                            indicatorColor: AppColor.detail,
                            tabAlignment: TabAlignment.start,
                            tabs: [
                          Tab(text: 'About Movie',),
                          Tab(text: 'Reviews',),
                          Tab(text: 'Cast',)
                        ]),
                        SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: TabBarView(children: [
                            TextDetails(title: searchS.overview),
                            TextDetails(title: searchS.overview),
                            TextDetails(title: searchS.overview),
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is SearchMovieError) {
            return Center(child: Text('No Internet'));
          } else {
            return Center(child: Text('data'));
          }
        },
      ),
    );
  }
}
