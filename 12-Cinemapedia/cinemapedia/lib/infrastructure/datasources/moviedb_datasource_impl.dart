import 'package:cinemapedia/config/constant/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource extends MoviesDataSource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieKey, 'language': 'en-UK'}));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) =>
            moviedb.posterPath != 'no-poster') //Example filter to not error
        .map((moviedb) => MovieMapper.moviedbToEntity(moviedb))
        .toList();

    return movies;
  }
}
