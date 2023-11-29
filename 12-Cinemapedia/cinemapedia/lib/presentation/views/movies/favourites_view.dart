import 'package:cinemapedia/presentation/providers/storage/favourite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class FavouriteView extends ConsumerStatefulWidget {
  const FavouriteView({super.key});

  @override
  FavouriteViewState createState() => FavouriteViewState();
}

class FavouriteViewState extends ConsumerState<FavouriteView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final movies =
        await ref.read(favouriteMovieProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMovies = ref.watch(favouriteMovieProvider).values.toList();

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favouriteMovies,
      )
    );
  }
}
