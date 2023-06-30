import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_try_2/screens/home/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app_try_2/screens/home/home_page.dart';
import 'package:wallpaper_app_try_2/screens/wallpaper_repo.dart';

import 'api/api_helper.dart';

void main() {
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<WallpaperBloc>(create: (context) => WallpaperBloc(repo: WallpaperRepo(apihelper: ApiHelper())),)
          ],
          child: const MyApp())
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
        home: Home_Page()
    );
  }
}

