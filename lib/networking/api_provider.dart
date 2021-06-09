import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../urls.dart';

class ApiProvider {
  Future<dynamic> get(
      {@required String url, Map<String, dynamic> header}) async {
    var responseJson;
    final response = await http.get(AppUrl?.baseUrl + url, headers: header);
    responseJson = _response(response);
    print("URL-> " + AppUrl?.baseUrl + url);
    print("response: ${jsonEncode(responseJson)}");
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response?.body != null) {
      return json.decode(response.body) as List;
    }
    return null;
  }
}
