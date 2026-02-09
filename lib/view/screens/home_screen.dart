import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/search_screen.dart';
import 'package:movies/view/widgets/custom_Navigator_bar.dart';
import 'package:movies/view/widgets/custom_text_button.dart';
import 'package:movies/view/widgets/custom_text_form.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/view_model/search_movie_cubit.dart';
import 'package:movies/view_model/top_rated_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<TopRatedCubit>().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.backGround,
        centerTitle: true,
        title: Text(
          'What do you want to watch?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.textWhite,
          ),
        ),
      ),
      body: BlocBuilder<TopRatedCubit, TopRatedState>(
        builder: (context, state) {
          if (state is TopRatedLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TopRatedSuccess) {
            final topRatedMovie = state.topRatedMovie.results;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    CustomTextForm(
                      readOnly: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topRatedMovie.length,
                        itemBuilder: (context, index) {
                          final movie = topRatedMovie[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 64),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomTextButton(title: 'Now Playing', onPressed: (){}),
                      CustomTextButton(title: 'Upcoming', onPressed: (){}),
                      CustomTextButton(title: 'Top rated', onPressed: (){}),
                      CustomTextButton(title: 'Popular', onPressed: (){},),
                    ],),
                    SizedBox(height: 20,),
                    CarouselSlider.builder(
                      itemCount: topRatedMovie.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = topRatedMovie[index];
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
                        viewportFraction: 0.4,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is TopRatedError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: CustomNavigatorBar() ,
    );
  }
}
