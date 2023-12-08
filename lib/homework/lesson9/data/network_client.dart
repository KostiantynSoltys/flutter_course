import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';

class NetworkCLient {
  final Dio _client;

  NetworkCLient()
      : _client = Dio(
          BaseOptions(
            baseUrl: 'http://www.wikiart.org/en/App/Painting',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

  Future<List<Painting>> getPaintings(String artist) async {
    try {
      final Response response =
          await _client.get('/PaintingsByArtist?artistUrl=$artist&json=2');
      await Future.delayed(const Duration(seconds: 1));

      final List rawData = jsonDecode(jsonEncode(response.data));
      List<Painting> paintings =
          rawData.map((p) => Painting.fromJson(p)).toList();
      return paintings;
    } catch (e) {
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            throw ('Connection timeout, try again later');
          case DioExceptionType.receiveTimeout:
            throw HttpException('Receive timeout, try again later');
          case DioExceptionType.badCertificate:
            throw HttpException('Bad certificate, check your network settings');
          case DioExceptionType.badResponse:
            throw HttpException('Bad response, try again later');
          case DioExceptionType.cancel:
            throw HttpException('Request was cancelled, try again');
          case DioExceptionType.connectionError:
            throw HttpException('Please check your internet connection');
          case DioExceptionType.unknown:
            throw HttpException('Please check your internet connection');
          default:
            throw HttpException('Something went wrong, try again later');
        }
      } else
        throw HttpException('My bad. Failed to load paintings');
    }
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
