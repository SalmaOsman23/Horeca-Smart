import 'dart:convert';

import 'package:horeca_smart/core/helper/cached_helper.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // dynamic token,
  }) async {
    var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.get(
      uRL,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> postData({
    required String url,
    required var data,
    //dynamic token,
  }) async {
    var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.post(
      uRL,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(data),
    );
  }

  static Future<http.Response> putData({
    required String url,
    required var data,
  }) async {
    var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.put(uRL,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(data));
  }

  //Partial Modifications ?//
  static Future<http.Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    //dynamic token,
  }) async {
    var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.patch(uRL,
        headers: {
          // 'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token',
        },
        body: data);
  }

  static Future<http.Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    //dynamic token,
  }) async {
    var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.delete(
      uRL,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $token',
      },
      //body: data,
    );
  }
}
