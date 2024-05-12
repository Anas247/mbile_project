import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio = Dio();
  Future<dynamic> get({required String uri,@required String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    log('Url = $uri token =$token');


  
    try {
       
  var response = await dio.get(uri,options: Options(headers: headers));
  log("data : ${response.data}");
   return response.data;
} on DioException catch (e) {
  log('${e.response?.data ?? 'oops there was error, try later'}');
  throw Exception('oops there was error, try later'); 
}catch (e)
 {
  log("error: ${e.toString()}");
  throw Exception('oops there was error, try later'); 
 }
  }
}
