import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/data/MoviesCubit.dart';
import 'package:movies_test/data/RestClient.dart';
import 'package:movies_test/pages/LandscapeHome.dart';
import 'package:movies_test/pages/MovieDetails.dart';
import 'package:movies_test/pages/PortraitHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RestClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // provide all the cubits to the app
        providers: [
          BlocProvider<MoviesCubit>(
              create: (BuildContext context) => MoviesCubit()..loadNext()),
          BlocProvider<SelectedMovieCubit>(
              create: (BuildContext context) => SelectedMovieCubit()),
          BlocProvider<TrailersCubit>(
              create: (BuildContext context) => TrailersCubit()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: const Home(),
            routes: {
              MovieDetailsPage.routeName: (context) => const MovieDetailsPage(),
            }));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // decide which home to show based on orientation
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? const PortraitHome()
        : const LandscapeHome();
  }
}
