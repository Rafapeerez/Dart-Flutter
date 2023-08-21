
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoving = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
      itemCount: nowPlayingMoving.length,
      itemBuilder: ((context, index) {
        final movie = nowPlayingMoving[index];
        return ListTile(
          title: Text(
            movie.title, 
            style: const TextStyle(
              fontSize: 20,
            )
          ),
          subtitle: Text(movie.overview),
        );
      }),
    );
  }
}
