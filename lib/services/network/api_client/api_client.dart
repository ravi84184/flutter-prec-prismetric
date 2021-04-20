import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pre_prismetic/services/flavor/flavor_config.dart';
import 'package:flutter_pre_prismetic/services/model/common_response.dart';
import 'package:flutter_pre_prismetic/services/network/exceptions/exceptions.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = FlavorConfig.instance.baseUrl;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;
    //TODO: need to fix
    // dio.interceptors.add(ApiErrorMessageInterceptor());
    // dio.interceptors.add(BadNetworkErrorInterceptor());
    // dio.interceptors.add(InternalServerErrorInterceptor());
    // dio.interceptors.add(UnauthorizedInterceptor());
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
    /*  if (Env.data.debugApiClient) {
      dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }*/
  }

  Future<Response> post(
    String path,
    dynamic data, {
    Function(int count, int total)? onSendProgress,
  }) async {
    try {
      return await dio.post(path,
          data: data, onSendProgress: onSendProgress ?? null);
    } on DioError catch (e) {
      throw ApiException(
          errorMessage: ApiErrorResponse.fromJson(
        json.decode(e.response?.data),
      ).error.message);
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await dio.put(path, data: data);
    } on DioError catch (e) {
      throw ApiException(
          errorMessage: ApiErrorResponse.fromJson(
        json.decode(e.response?.data),
      ).error.message);
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on DioError catch (e) {
      throw ApiException(
          errorMessage: ApiErrorResponse.fromJson(
        json.decode(e.response?.data),
      ).error.message);
    }
  }

  Future<Response> get(
    String path, {
    dynamic data,
  }) async {
    try {
      return await dio.get(path, queryParameters: data);
    } on DioError catch (e) {
      throw ApiException(
          errorMessage:
              ApiErrorResponse.fromJson(e.response?.data).error.message);
    }
  }
}

class ApiErrorResponse extends CommonResponse {
  ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    this.error =
        (json['error'] != null ? Error.fromJson(json['error']) : null)!;
    this.status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
