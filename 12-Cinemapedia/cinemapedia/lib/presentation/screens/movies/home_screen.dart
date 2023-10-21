import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar()
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoving = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    
    //CustomScrollView doesnt have child propertie, thats why we use slivers.
    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.zero ,
            centerTitle: false,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  //const CustomAppBar(),

                  MoviesSlideshow(movies: slideshowMovies),

                  MovieHorizontalListView(
                    movies: nowPlayingMoving,
                    title: 'Now Playing',
                    subtitle: 'Present',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Popular',
                    loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Upcoming...',
                    loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Top Rated',
                    loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                  ),

                  const SizedBox( height: 15 )
                ],
              );

            },
            childCount: 1
          ),
        )
      ] 
    );
  }
}
