import 'dart:convert';
import 'dart:io';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

enum HttpMethod { POST, GET, PUT, DELETE, PATCH }

class RestClient extends GetxService {
  static const BASE_URL = "https://mahati.xyzuan.my.id/api";

  Map<String, String> header() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Map<String, String> headerWithToken(String accessToken) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  Future<http.Response> request(
    String url,
    HttpMethod method,
    Map<String, dynamic>? params,
  ) async {
    try {
      Uri uri = Uri.parse(BASE_URL + url);
      late http.Response response;

      params ??= {};

      if (method == HttpMethod.POST) {
        response = await http.post(
          uri,
          body: jsonEncode(params),
          headers: header(),
        );
      } else if (method == HttpMethod.DELETE) {
        response = await http.delete(uri, headers: header());
      } else if (method == HttpMethod.PUT) {
        response = await http.patch(
          uri,
          body: jsonEncode(params),
          headers: header(),
        );
      } else {
        response = await http.get(uri, headers: header());
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return response;
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> requestWithToken(
    String url,
    HttpMethod method,
    Map<String, dynamic>? params,
    String accessToken,
  ) async {
    try {
      Uri uri = Uri.parse(BASE_URL + url);
      late http.Response response;

      params ??= {};

      if (method == HttpMethod.POST) {
        response = await http.post(
          uri,
          body: jsonEncode(params),
          headers: headerWithToken(accessToken),
        );
      } else if (method == HttpMethod.DELETE) {
        response =
            await http.delete(uri, headers: headerWithToken(accessToken));
      } else if (method == HttpMethod.PUT) {
        response = await http.patch(
          uri,
          body: jsonEncode(params),
          headers: header(),
        );
      } else {
        response = await http.get(uri, headers: headerWithToken(accessToken));
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        return response;
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } catch (e) {
      throw Exception(e);
    }
  }
}
