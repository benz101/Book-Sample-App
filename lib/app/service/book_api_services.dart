import 'package:book_sample_app/app/helper/base_url.dart';
import 'package:book_sample_app/app/helper/options_for_dio.dart';
import 'package:book_sample_app/app/model/response/list_of_book_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BookAPIServices {
  final _dio = Dio();

  Future<ListOfBookResponse> getListOfBook(int page, {String? keyword}) async {
    debugPrint('keyword: $keyword');
    try {
      final response = await _dio.get('$baseURL/?page=$page',
          options: optionsForDio,
          queryParameters: (keyword??'').isNotEmpty ? {'search': keyword} : null);
      debugPrint('getListOfBook success: ${response.data}');
      return ListOfBookResponse.fromJson(response.data);
    } catch (e) {
      debugPrint('getListOfBook error: $e');
      return ListOfBookResponse();
    }
  }

  Future<ItemOfBook> getDetailOfBook(int id) async {
    try {
      final response = await _dio.get('$baseURL/$id/',
          options: optionsForDio);
      debugPrint('getDetailOfBook success: ${response.data}');
      return ItemOfBook.fromJson(response.data);
    } catch (e) {
      debugPrint('getDetailOfBook error: $e');
      return ItemOfBook();
    }
  }
}
