import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:wallpaper/wallpaper.dart';

class Wallpaper_Detail_Page extends StatelessWidget {
  String imgUrl;
  Wallpaper_Detail_Page({
    required  this.imgUrl


  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [

          Hero(
            tag: 'card',
            child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.network(imgUrl,fit: BoxFit.cover,)),
          ),
          Positioned(
            top: 40,
            left: 6,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  child: Icon(Icons.arrow_back_ios_new)),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            right:10,
            child: Container(
              height: 100,
              width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.info,size: 60,color: Colors.white,),
                      Text("info",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),)
                    ],
                  ),

                  InkWell(
                    onTap: (){
                      downloadWallpaper();
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.download_outlined,size: 60,color: Colors.white,),
                        Text("Save",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      setWallpaper(context);

                    },
                    child: const Column(
                      children: [
                        Icon(Icons.brush_outlined,size: 60,color: Colors.white,),
                        Text("Apply",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),


    );

  }

  void setWallpaper(context){
    var progress = Wallpaper.imageDownloadProgress(imgUrl);


    progress.listen((event) {
      print(event);

    },onDone: ()async{
      print("Image Downloaded in cache");
      var mHeight = MediaQuery.of(context).size.height;
      var mWidth = MediaQuery.of(context).size.width;
      await  Wallpaper.homeScreen(
        height:mHeight,
        width:mWidth,
        options: RequestSizeOptions.RESIZE_FIT,

      );
      print("Wallapper set successfully");


    },
        onError: (errorMsg){
          print(errorMsg);
        });
  }

  void downloadWallpaper(){
    GallerySaver.saveImage(imgUrl).then((value) => print("image downloaded"));
  }
}
