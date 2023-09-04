import 'dart:convert';
import 'dart:io';

import 'package:chate/data/app_exceptions.dart';
import 'package:http/http.dart'as http;
import 'package:chate/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future<dynamic>getApi(String url)async{
    dynamic responseJson;
try {
   final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
   responseJson=returnResponse(response);

} on SocketException{
  throw InternetException('');
}on RequestTimeOut{
  throw RequestTimeOut('');
}
   return responseJson;
  }


  @override
  Future<dynamic>postApi( var data ,String url)async{
    dynamic responseJson;
try {
   final response = await http.post(Uri.parse(url),
  //  body: jsonEncode(data)//worked on the formdatat
  body: data
   
   ).timeout(Duration(seconds: 10));
   responseJson=returnResponse(response);

} on SocketException{
  throw InternetException('');
}on RequestTimeOut{
  throw RequestTimeOut('');
}
   return responseJson;
  }




  dynamic returnResponse(http.Response response){
switch(response.statusCode){
  case 200 :
  dynamic responseJson =jsonDecode(response.body);
   print(responseJson);

  return responseJson;


  
  case 400:
   dynamic responseJson =jsonDecode(response.body);
   print(responseJson);
  return responseJson;
  default:
  throw FetchDataException('Errror Accured While Communicating with Server'+ response.statusCode.toString());
}
  }
}