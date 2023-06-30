import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_try_2/screens/home/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app_try_2/ui_helper.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();


}

var searchController = TextEditingController();


class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {

    super.initState();
    BlocProvider.of<WallpaperBloc>(context).add(GetTrendingWallpaperEvent(per_page: '50'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().AppbgColor,
        body: BlocBuilder<WallpaperBloc,WallpaperState>(builder: (context, state) {
          if(state is WallpaperLoadingState){
            return Center(child: CircularProgressIndicator());
          }else if (state is WallpaperLoadedState){
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: InkWell(
                                  onTap: (){
                                    BlocProvider.of<WallpaperBloc>(context).add(GetSearchWallpaperEvent(query:searchController.text.toString(),));
                                  },
                                  child: const Icon(Icons.search, color: Colors.black,)),
                              hintText: 'Find Wallapers..',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.6)),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Colors.white, width: 0.5,))),
                        ),),
                      mHeightSpacer(mHeight: 16),
                      Expanded(
                        flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Trending Wallpapers",style: mText28(mFontWeight: FontWeight.bold),),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AspectRatio(
                                      aspectRatio: 9/16,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(state.wallpapers.photos![index].src!.portrait!,fit: BoxFit.cover,),
                                      ),
                                    ),
                                  );

                                },),
                              )
                            ],
                          )),
                      mHeightSpacer(mHeight: 16),
                      Expanded(
                        flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("The color tone",style: mText28(mFontWeight: FontWeight.bold),),
                             Expanded(
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: AppColors().The_colorTone.length,
                                 itemBuilder: (context, index) {
                                 return  Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Container(
                                     decoration: BoxDecoration(
                                       color: AppColors().The_colorTone[index]['colorTone'],
                                       borderRadius: BorderRadius.circular(12)
                                     ),
                                     height: 35,
                                     width: 70,

                                   ),
                                 );
                               },),
                             )
                            ],
                          )),
                      mHeightSpacer(mHeight: 16),
                      Expanded(
                        flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Categories",style: mText28(mFontWeight: FontWeight.bold),),
                              mHeightSpacer(mHeight: 14),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 18,
                                      crossAxisSpacing: 20,

                                      childAspectRatio: 16/9),
                                    itemCount: AppStockImage.images.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                              child: Image.network(AppStockImage.images[index]['path'],fit: BoxFit.cover,)),
                                          Align(
                                            alignment : Alignment.center,
                                              child: Text(AppStockImage.images[index]['name'],style: mText20(mColor: Colors.white),)),
                                        ],
                                      );
                                    },),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          }else if (state is WallpaperErrorState){
            return Container();
          }else{
            return Container();
          }
        },),

      ),
    );
  }
}
