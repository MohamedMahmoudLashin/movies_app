import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';
import 'package:movies/view/widgets/custom_text_button.dart';
import 'package:movies/view/widgets/movie_name_title.dart';
import 'package:movies/view_model/search_movie_cubit.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backGround,
        appBar: CustomAppBar(title: 'Details',
            sufIcon: Icon(Icons.library_add_check_outlined, size: 30, color: Colors.white)),
        body: BlocBuilder<SearchMovieCubit, SearchMovieState>(
          builder: (context, state) {
            if (state is SearchMovieLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is SearchMovieSuccess){
              final searchMovie =state.searchMovie.results;
              int index =0 ;
              final searchS = searchMovie[index];
              return Column(
                children: [
                  Stack(
                    children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.vertical(bottom:Radius.circular(25) ),
                      child: Image.network(
                              "https://image.tmdb.org/t/p/w500${searchS.posterPath}",
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,),
                    ),
                  ),
                      Positioned(
                        left: 20,
                          bottom: 1,
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network("https://image.tmdb.org/t/p/w500${searchS.posterPath}",
                        height: 150,
                        width: 120,),
                      )),
                      Positioned(
                          right: 30,
                          bottom: 15,
                          child: Container(
                            decoration: BoxDecoration(color: AppColor.contColor,borderRadius: BorderRadius.circular(25)),width: 54,height: 24,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.star_border_purple500_outlined,color: AppColor.yellowStar,)),
                                SizedBox(width: 5,),
                                Text("${searchS.voteAverage}"),
                              ],
                            ),))
                    ],
                  ),
                  MovieNameTitle(movieName: "${searchS.title}",movieTime:searchS.video.toString(),movieYear:searchS.popularity.toInt(),movieType: searchS.title  ,)
                  , Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextButton(title: 'About Movie', onPressed: () {
                      }),
                      CustomTextButton(title: 'Reviews', onPressed: () {}),
                      CustomTextButton(title: 'Cast', onPressed: () {}),
                    ],
                  )
                ],
              );
            }else if (state is SearchMovieError){
              return Center(child: Text('No Internet'));
            }else{
              return Center(child: Text('data'),);
            }
          },
        )

    );
  }
}
