import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// ignore: constant_identifier_names
enum HttpMethod { POST, GET, PUT, DELETE, PATCH }

class RestClient extends GetxService {
  // ignore: constant_identifier_names
  String BASE_URL = dotenv.get('BASE_URL');

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

  /// Request with token
  /// [url] is endpoint
  /// [method] is http method
  /// [params] is request body
  Future<http.Response> request(
    String url,
    HttpMethod method,
    Map<String, dynamic>? params, {
    File? imageFile,
  }) async {
    try {
      Uri uri = Uri.parse(BASE_URL + url);
      late http.Response response;

      params ??= {};

      if (method == HttpMethod.POST) {
        if (imageFile != null) {
          var request = http.MultipartRequest('POST', uri);
          request.headers.addAll(header());

          params.forEach((key, value) {
            request.fields[key] = value.toString();
          });

          request.files.add(await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            contentType: MediaType('image', 'jpeg'),
          ));

          var streamedResponse = await request.send();
          response = await http.Response.fromStream(streamedResponse);
        } else {
          response = await http.post(
            uri,
            body: jsonEncode(params),
            headers: header(),
          );
        }
      } else if (method == HttpMethod.DELETE) {
        response = await http.delete(uri, headers: header());
      } else if (method == HttpMethod.PUT) {
        response = await http.put(
          uri,
          body: jsonEncode(params),
          headers: header(),
        );
      } else if (method == HttpMethod.PATCH) {
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

  /// Request with token
  /// [url] is endpoint
  /// [method] is http method
  /// [params] is request body
  /// [accessToken] is token
  Future<http.Response> requestWithToken(
    String url,
    HttpMethod method,
    Map<String, dynamic>? params,
    String accessToken, {
    File? imageFile,
  }) async {
    try {
      Uri uri = Uri.parse(BASE_URL + url);
      late http.Response response;

      params ??= {};

      if (method == HttpMethod.POST) {
        if (imageFile != null) {
          var request = http.MultipartRequest('POST', uri);
          request.headers.addAll(headerWithToken(accessToken));

          params.forEach((key, value) {
            request.fields[key] = value.toString();
          });

          request.files.add(await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            contentType: MediaType('image', 'jpeg'),
          ));

          var streamedResponse = await request.send();
          response = await http.Response.fromStream(streamedResponse);
        } else {
          response = await http.post(
            uri,
            body: jsonEncode(params),
            headers: headerWithToken(accessToken),
          );
        }
      } else if (method == HttpMethod.DELETE) {
        response =
            await http.delete(uri, headers: headerWithToken(accessToken));
      } else if (method == HttpMethod.PUT) {
        if (imageFile != null) {
          var request = http.MultipartRequest('PUT', uri);
          request.headers.addAll(headerWithToken(accessToken));

          params.forEach((key, value) {
            request.fields[key] = value.toString();
          });

          request.files.add(await http.MultipartFile.fromPath(
            'image',
            imageFile.path,
            contentType: MediaType('image', 'jpeg'),
          ));

          var streamedResponse = await request.send();
          response = await http.Response.fromStream(streamedResponse);
        } else {
          response = await http.put(
            uri,
            body: jsonEncode(params),
            headers: headerWithToken(accessToken),
          );
        }
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
