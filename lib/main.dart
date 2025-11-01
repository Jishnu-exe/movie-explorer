import 'package:flutter/material.dart';
import 'helpers/csv_parser.dart';
import 'services/movie_service.dart';
import 'pages/home_page.dart';
import 'models/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<Movie> movies = await CsvParser.loadMovies('assets/movies.csv'); // <-- specify List<Movie>
  runApp(MyApp(movies: movies));
}

class MyApp extends StatelessWidget {
  final List<Movie> movies; // <-- specify List<Movie>
  const MyApp({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    final movieService = MovieService(movies);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      title: 'Movie Explorer',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
      home: HomePage(movieService: movieService),
    );
  }
}
