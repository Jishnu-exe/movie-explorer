import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import '../models/movie.dart';

class CsvParser {
  static Future<List<Movie>> loadMovies(String path) async {
    final data = await rootBundle.loadString(path);
    final rows = const CsvToListConverter().convert(data);
    List<Movie> movies = [];
    for (var i = 1; i < rows.length; i++) {
      try {
        movies.add(Movie.fromCsv(rows[i].map((e) => e.toString()).toList()));
      } catch (_) {
        continue;
      }
    }
    return movies;
  }
}
