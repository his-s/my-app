import 'dart:convert';

import 'package:doctor_guid_app/data/interfaces/app_data_interface.dart';
import 'package:doctor_guid_app/models/book.dart';
import 'package:flutter/services.dart';

class LocalDataSource implements AppDataInterface {
  List<Book> _books = [];
  List<Book> get books => _books;
  @override
  Future<List<Book>> getBooks() async {
    String jsonString = await rootBundle.loadString('assets/json/json.json');
    List<dynamic> data = json.decode(jsonString);
    _books = data.map((e) => Book.fromMap(e)).toList();
    return _books;
  }
}
