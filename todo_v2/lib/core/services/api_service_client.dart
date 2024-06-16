import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:todo_v2/core/services/shared_prefs.dart';
import 'package:todo_v2/env.dart';

enum NetErrorType {
  none,
  disconnected,
  timeout,
  denied,
  unknown,
}

typedef HttpRequest = Future<http.Response> Function();

class ApiServicesClient {
  static const String baseURL = AppEnvironment.apiBaseURL;
  static int timeoutInSeconds = 30;

  final SharedPreferencesManager _sharedPreferencesManager =
      SharedPreferencesManager();
  //make a get request

  Future<HttpResponse> get({
    required String endpoint,
    required String userId,
  }) async {
    http.Response response = await http
        .get(
          Uri.parse('$baseURL $endpoint /$userId'),
        )
        .timeout(
          Duration(
            seconds: timeoutInSeconds,
          ),
        );
    return await _request(
      () async {
        return response;
      },
    );
  }

  Future<HttpResponse> getPrivate({
    required String endpoint,
    required String token,
  }) async {
    http.Response response = await http.get(
      Uri.parse('$baseURL$endpoint?token=$token'),
      headers: {
        "Content-Type": "application/json",
      },
    ).timeout(
      Duration(
        seconds: timeoutInSeconds,
      ),
    );
    return await _request(
      () async {
        return response;
      },
    );
  }

  // make a post request
  Future<HttpResponse> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    var body = data;

    http.Response response = await http
        .post(
          Uri.parse(baseURL + endpoint),
          body: body,
        )
        .timeout(
          Duration(
            seconds: timeoutInSeconds,
          ),
        );
    return await _request(
      () async {
        return response;
      },
    );
  }

  //make a delete request
  Future<HttpResponse> deletePrivate({
    required String endpoint,
    required Map<String, String> data,
  }) async {
    http.Response response = await http
        .delete(
          Uri.parse(baseURL + endpoint),
          body: data,
        )
        .timeout(
          Duration(
            seconds: timeoutInSeconds,
          ),
        );
    return await _request(
      () async {
        return response;
      },
    );
  }

  // make a put request
  Future<HttpResponse> put({
    required String endpoint,
    required dynamic data,
  }) async {
    var body = json.encode(data);
    http.Response response = await http
        .put(
          Uri.parse(baseURL + endpoint),
          body: body,
        )
        .timeout(
          Duration(
            seconds: timeoutInSeconds,
          ),
        );
    return await _request(
      () async {
        return response;
      },
    );
  }

  Future<HttpResponse> uploadImage({
    required String endpoint,
    required Map<String, String> data,
  }) async {
    var body = data;

    http.Response response = await http
        .post(
          Uri.parse(baseURL + endpoint),
          body: body,
        )
        .timeout(
          Duration(
            seconds: timeoutInSeconds,
          ),
        );
    return await _request(
      () async {
        return response;
      },
    );
  }

  Future<HttpResponse> uploadFiles({
    required String endpoint,
    required List<MultipartBody> multipartBody,
  }) async {
    return await _request(
      () async {
        http.MultipartRequest request =
            http.MultipartRequest('POST', Uri.parse(baseURL + endpoint));
        for (MultipartBody multipart in multipartBody) {
          File file = File(multipart.file.path);
          request.files.add(
            http.MultipartFile(
              multipart.key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split('/').last,
            ),
          );
        }
        http.Response response = await http.Response.fromStream(
          await request.send(),
        );
        return response;
      },
    );
  }

  Future<HttpResponse> _request(HttpRequest request) async {
    try {
      return HttpResponse(await request());
    } on Exception catch (e) {
      debugPrint("Network call failed. error = ${e.toString()}");
      return HttpResponse.error();
    }
  }

  Future<void> saveToken(String token) async {
    _sharedPreferencesManager.putString('_authToken', token);
    _sharedPreferencesManager.putBool('isLoggedIn', true);
  }
}

class HttpResponse {
  final http.Response raw;

  NetErrorType errorType = NetErrorType.none;

  bool get success => errorType == NetErrorType.none;

  String get body => raw.body;

  Map<String, String> get headers => raw.headers;

  int get statusCode => raw.statusCode;

  HttpResponse(this.raw) {
    //200 means all is good :)
    if (raw.statusCode == 200 || raw.statusCode == 201) {
      errorType = NetErrorType.none;
    } else if (raw.statusCode >= 500 && raw.statusCode < 600) {
      errorType = NetErrorType.timeout;
    } else if (raw.statusCode >= 400 && raw.statusCode < 500) {
      errorType = NetErrorType.denied;
    } else {
      errorType = NetErrorType.unknown;
    }
  }

  HttpResponse.error()
      : raw = http.Response("", -1),
        errorType = NetErrorType.unknown;

  HttpResponse.empty()
      : raw = http.Response("", 200),
        errorType = NetErrorType.none;
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
