

import '../api/api_helper.dart';
import '../api/model/wallpaper_model.dart';

class WallpaperRepo{
  ApiHelper apihelper;
  WallpaperRepo({required this.apihelper});
  Future<WallpaperDataModel> getTrendingWallpapers({String? perPage})async{
    var mUrl = "curated?per_page=${perPage ?? 50}";

    var jsonRes = await apihelper.getApi(mUrl);
    return WallpaperDataModel.fromJson(jsonRes!);

  }

  Future<WallpaperDataModel> getSearchedWallpaper(String query,{String? color,String? perPage})async {
    var url = "search?query=${query == "" ? "Nature" : query}&per_page=${perPage ?? 26}&color=$color";
    try {
      var jsonRes = await apihelper.getApi(url);
      return WallpaperDataModel.fromJson(jsonRes);
    } catch (e) {
      return WallpaperDataModel();
    }
  }
  }