import 'package:flutter/material.dart';

SizedBox mHeightSpacer({double mHeight = 20}) {
  return SizedBox(height: mHeight);
}

SizedBox mWidthSpacer({double mWidth = 20}) {
  return SizedBox(width: mWidth);
}

class AppColors {
  Color AppbgColor = const Color(0xffdde7f3);
  static const List The_colorTone = [
    {
      "name" : "fdb7b9",
      "colorTone": const Color(0xfffdb7b9)
    },
    {
      "name" : "4164e0",
      "colorTone": const Color(0xff4164e0)
    },
    {
      "name" : "6141e0",
      "colorTone": const Color(0xff6141e0)
    },
    {
      "name" : "60bfc1",
      "colorTone": const Color(0xff60bfc1)
    },
    {
      "name" : "292929",
      "colorTone": const Color(0xff292929)
    },
    {
      "name" : "ff9a0d",
      "colorTone": const Color(0xffff9a0d)
    },
    {
      "name" : "b647eb",
      "colorTone": const Color(0xffb647eb)
    }
  ];
}

class AppStockImage{
  static const List images = [
    {
      "name" : "Abstract",
      "path" : "https://images.wallpapersden.com/image/download/wave-of-abstract-colors_a2tna2uUmZqaraWkpJRpaWVlrWdpa20.jpg"
    },
    {
      "name" : "Nature",
      "path" :"https://4.bp.blogspot.com/-GX7q-ScmeLg/Tl8FoAN2P0I/AAAAAAAAAvw/BpPsqjzw66Q/s1600/8.jpg"
    },{
      "name" : "Cars",
      "path" :"https://wallpapercave.com/wp/wp3543058.jpg"
    },{
      "name" : "Art",
      "path" :"https://i.pinimg.com/originals/98/d2/cd/98d2cd0671de0d027dfd0a698691a119.jpg"
    }
  ];

}



TextStyle mText38({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 38,
      fontWeight: mFontWeight  ,
      fontFamily: "Kanit");
}

TextStyle mText28({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 28,
      fontWeight: mFontWeight,
      fontFamily: "Kanit");
}

TextStyle mText24({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 24,
      fontWeight: mFontWeight,
      fontFamily: "Kanit");
}

TextStyle mText20({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 20,
      fontWeight:  mFontWeight,
      fontFamily: "Kanit");
}
TextStyle mText22({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 22,
      fontWeight:  mFontWeight,
      fontFamily: "Kanit");
}

TextStyle mText16({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 16,
      fontWeight: mFontWeight,
      fontFamily: "Kanit");
}

TextStyle mText12({mFontWeight = FontWeight.normal, mColor = Colors.black}) {
  return TextStyle(
      color:  mColor,
      fontSize: 12,
      fontWeight:  mFontWeight,
      fontFamily: "Kanit");
}
