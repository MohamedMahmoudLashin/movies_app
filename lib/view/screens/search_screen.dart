import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/app_color.dart';
import 'package:movies/view/screens/details_screen.dart';
import 'package:movies/view/widgets/Custom_app_bar.dart';
import 'package:movies/view/widgets/custom_Navigator_bar.dart';
import 'package:movies/view/widgets/custom_search_details.dart';
import 'package:movies/view/widgets/custom_text_form.dart';
import 'package:movies/view_model/search_movie/search_movie_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: CustomAppBar(
        toolTipMessage: 'Search about what do you want',
        angle: 3.1,
        title: 'Search',
        sufIcon: Icon(
          Icons.info_outline_rounded,
          color: AppColor.appBarColor,
          size: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomTextForm(
              readOnly: false,
              controller: searchController,
              onSubmit: (value) {
                if (value.isNotEmpty) {
                  context.read<SearchMovieCubit>().getSearchMovies(value);
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                builder: (context, state) {
                  if (state is SearchMovieLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchMovieSuccess) {
                    final searchMovie = state.searchMovie.results;
                    if (searchMovie.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/Search.svg"),
                            SizedBox(height: 15,),
                            Text(
                              'we are sorry, we can \n '
                                  'not find the movie :(\n '
                                  'Find your movie by Type title, categories, years, etc ',
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColor.textWhite,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: searchMovie.length,
                        itemBuilder: (context, index) {
                          final searchS = searchMovie[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(26),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        GestureDetector(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              26,
                                            ),
                                            child: Image.network(
                                              searchS.posterPath != null
                                                  ? "https://image.tmdb.org/t/p/w500${searchS.posterPath}"
                                                  : "https://img.icons8.com/?size=100&id=6i8IfGyeoebS&format=png&color=000000",
                                              width: 120,
                                              height: 170,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(movie:searchS),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      height: 170,
                                      width: 200,
                                      child: CustomDetailsCoulmn(
                                        movieName: searchS.title,
                                        movieRate: searchS.voteAverage,
                                        movieType: "Unknown",
                                        movieYear: searchS.releaseDate,
                                        movieTime: searchS.video.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (state is SearchMovieError) {
                    return Center(child: Text('Error : ${state.message}'));
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/search.png"),
                          SizedBox(height: 20),
                          Text(
                            'Find your movie by Type title,\n categories, years, etc ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.iconHint,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigatorBar(),
    );
  }
}
