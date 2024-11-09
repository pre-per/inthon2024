import 'dart:async';
import 'package:inthon2024/model/cardModel.dart';
import 'package:dio/dio.dart';

class DisplayRepository {
  final _dio = Dio();
  final _targetUrl = 'https://inthon.steadfastree.xyz/exhibitions';
  Future<List<CardModel>> getAllDisplays() async {
    try {
      final resp = await _dio.get(_targetUrl);
      print(resp.data);

      if (resp.data is List) {
        return (resp.data as List)
            .map((json) => CardModel.fromJson(json: json))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } on DioError catch (e) {
      print('Network or server error: ${e.message}');
      throw Exception('Failed to load campaign information');
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('An unknown error occurred');
    }
  }
}