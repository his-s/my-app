import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'implementation/local_app_data.dart';
import 'implementation/remote_app_data.dart';

class AppDataRepo implements AppDataInterface {
  final LocalAppData _localAppData;
  final RemoteAppData _remoteAppData;
  final ConnectivityResult _connectivityResult;

  AppDataRepo(
      {required LocalAppData localAppData,
      required RemoteAppData remoteAppData,
      required ConnectivityResult connectivityResult})
      : _localAppData = localAppData,
        _remoteAppData = remoteAppData,
        _connectivityResult = connectivityResult;

  @override
  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    try {
      if (_connectivityResult == ConnectivityResult.none) {
        articles = await _localAppData.getArticles();
      } else {
        articles = await _remoteAppData.getArticles();
      }
    } catch (error) {
      if (error is SocketException) {
        // Handle no internet connection
        // Load data from local database and update state
        // ...
        log('will load from local database');
      }
    }
    return articles;
  }

  @override
  List<Category> getCategories() {
    if (_connectivityResult == ConnectivityResult.none) {
      return _localAppData.getCategories();
    } else {
      return _remoteAppData.getCategories();
    }
  }

  @override
  List<Section> getSections() {
    if (_connectivityResult == ConnectivityResult.none) {
      return _localAppData.getSections();
    } else {
      return _remoteAppData.getSections();
    }
  }
}
