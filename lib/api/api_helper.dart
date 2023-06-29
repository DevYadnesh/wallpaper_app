import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpCliet;


import 'api_exception.dart';

class ApiHelper {
  var base_Url = "https://api.pexels.com/v1/";

  Future<dynamic> getApi(String url, {Map<String, String>? header}) async {
    var mUrl = "$base_Url$url";
    var api_Key = "2END2WKUKJ7JjMy0W17l06XJXevCvC9GqeI66GW5BX4OEWqGw0rFgBsd";
    try {
      var res = await httpCliet.get(Uri.parse(mUrl),
          headers: header ?? {"Authorization": api_Key});
      print(res.statusCode);
      return checkResponse(res);
    } on SocketException {
      print("Interet Error");
      throw FetchDataException("No Internert Connection");
    }
  }

  void postApi() {}

  dynamic checkResponse(httpCliet.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occured while trying to communicate with server with Status Code: ${response.statusCode}");
    }
  }
}
