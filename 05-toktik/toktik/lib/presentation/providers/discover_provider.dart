import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repository/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoRepository
  });

  Future<void> loadPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = await videoRepository.getTrendingVideosByPage(1) ;

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
