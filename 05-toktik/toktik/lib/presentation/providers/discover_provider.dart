import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: Repository, data source

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadPage() async {
    await Future.delayed(const Duration(seconds: 2));

    //Transformation LocalVideo in a VideoPost List
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
