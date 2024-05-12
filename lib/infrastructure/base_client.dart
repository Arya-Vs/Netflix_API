import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/tmdb_api_response.dart';

Future<dynamic> apicall(String url) async {
  try{
  http.Response response;
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
    TMDBApiResponseModel tmdbApiResponse = TMDBApiResponseModel.fromJson(data);
    return tmdbApiResponse;
  }else{
    throw 'failed to fetch data : ${response.statusCode}';
  }
  } catch (error){
    throw 'Something wrong in the api calling $error';
  }
}


// Future<dynamic> postData(String url) async {

// Map<String,dynamic> data ={
//   'name' : 'parvathy',
//   'phone' : '986'
// };

//   try{
//   http.Response response;
//   response = await http.post(Uri.parse(url),body:data );
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
//     TMDBApiResponseModel tmdbApiResponse = TMDBApiResponseModel.fromJson(data);
//     return tmdbApiResponse;
//   }else{
//     throw 'failed to fetch data : ${response.statusCode}';
//   }
//   } catch (error){
//     throw 'Something wrong in the api calling $error';
//   }
// }


