import 'package:flutter/material.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/search_screen.dart';
import 'package:movies/view/widgets/custom_Navigator_bar.dart';
import 'package:movies/view/widgets/custom_text_button.dart';
import 'package:movies/view/widgets/custom_text_form.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/view/widgets/text_details.dart';
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
                    SizedBox(height: 34),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow:[BoxShadow(color:AppColor.iconHint,blurRadius:40,spreadRadius: -14 )]
                      ),
                      child: CarouselSlider.builder(
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
                    ),
                    SizedBox(height: 20,),
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                              labelPadding: EdgeInsets.symmetric(horizontal: 15),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                              isScrollable: true,
                              dividerColor: AppColor.backGround,
                              unselectedLabelColor: AppColor.iconHint,
                              indicatorWeight: 5,
                              labelColor: AppColor.textWhite,
                              indicatorColor: AppColor.detail,
                              tabAlignment: TabAlignment.start,
                              tabs: [
                                Tab(text: 'Now playing',),
                                Tab(text: 'Upcoming',),
                                Tab(text: 'Top rated',),
                                Tab(text: 'Popular',)
                              ]),
                          SizedBox(
                            width: double.infinity,
                            height: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:15),
                              child: TabBarView(children: [
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 15,mainAxisSpacing: 10,childAspectRatio: .7),
                                    itemCount: topRatedMovie.length,
                                    itemBuilder: (context,i){
                                      final movie =topRatedMovie[i];
                                     return SizedBox(
                                       width: 250,
                                       height: 300,
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.circular(15),
                                         child: Image.network(
                                           "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                           fit: BoxFit.fill,
                                         ),
                                       ),
                                     );
                                    }),

                                GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 15,mainAxisSpacing: 10,childAspectRatio: .7),
                                    itemCount: topRatedMovie.length,
                                    itemBuilder: (context,i){
                                      final movie =topRatedMovie[i];
                                      return SizedBox(
                                        width: 250,
                                        height: 300,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    }),

                                GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 15,mainAxisSpacing: 10,childAspectRatio: .7),
                                    itemCount: topRatedMovie.length,
                                    itemBuilder: (context,i){
                                      final movie =topRatedMovie[i];
                                      return SizedBox(
                                        width: 250,
                                        height: 300,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    }),
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 15,mainAxisSpacing: 10,childAspectRatio: .7),
                                    itemCount: topRatedMovie.length,
                                    itemBuilder: (context,i){
                                      final movie =topRatedMovie[i];
                                      return SizedBox(
                                        width: 250,
                                        height: 300,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    }),
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is TopRatedError) {
            return Center(child: Text('Error: ${state.message}'));
          } 
          else {
            return Scaffold(
              body: SafeArea(child:Center(child: Text("Oops There is An Error"),) ),
            );
          }
        },
      ),
      bottomNavigationBar: CustomNavigatorBar() ,
    );
  }
}
