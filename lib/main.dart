import 'package:flutter/material.dart';
import 'package:movies/view/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/view/screens/search_screen.dart';
import 'package:movies/view_model/top_rated_cubit.dart';
import 'view_model/search_movie_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopRatedCubit(),
        ),
        BlocProvider(
          create: (context) => SearchMovieCubit(),
        ),
      ],
      child: MaterialApp(title: 'Movies', home: HomeScreen()),
    );
  }
}
