import 'dart:async';
import 'package:dio/dio.dart';

import '../model/displaycardModel.dart';

class DisplayRepository {
  final _dio = Dio();
  final _targetUrl = 'https://inthon.steadfastree.xyz/exhibitions';
  Future<List<DisplayCardModel>> getAllDisplays() async {
    try {
      final resp = await _dio.get(_targetUrl);
      print(resp.data);

      if (resp.data is List) {
        return (resp.data as List)
            .map((json) => DisplayCardModel.fromJson(json: json))
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