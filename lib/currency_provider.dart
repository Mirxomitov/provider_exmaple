import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_exmaple/model.dart';

class CurrencyProvider extends ChangeNotifier {
  final _dio = Dio();
  List<Model> ls = [];

  bool loading = true;

  Future<void> getCurrencies() async {
    final response = await _dio.request('https://cbu.uz/uz/arkhiv-kursov-valyut/json/');
    ls = (response.data as List<dynamic>).map((e) => Model.fromJson(e)).toList();
    loading = false;
    notifyListeners();
  }

  CurrencyProvider() {
    getCurrencies();
  }
}
