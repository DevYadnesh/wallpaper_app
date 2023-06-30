import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app_try_2/api/model/wallpaper_model.dart';

import '../../wallpaper_repo.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperRepo repo;
  WallpaperBloc({required this.repo}) : super(WallpaperInitialState()) {
    on<GetTrendingWallpaperEvent>((event, emit) async{
      emit(WallpaperLoadingState());
    try{
      var wallpaper = await repo.getTrendingWallpapers(perPage: event.per_page);
      emit(WallpaperLoadedState(wallpapers: wallpaper));
    }catch (e){
      emit (WallpaperErrorState(errorMsg:e.toString()));
    }
    });
  }
}
