part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class GetTrendingWallpaperEvent extends WallpaperEvent{
String? per_page;
GetTrendingWallpaperEvent({ this.per_page});
}

class GetSearchWallpaperEvent extends WallpaperEvent{

  String query;
  String? per_page;
  GetSearchWallpaperEvent({required this.query,this.per_page});

}
