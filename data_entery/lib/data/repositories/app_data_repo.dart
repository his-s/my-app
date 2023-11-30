import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_entery/data/models/articles_model.dart';
import 'package:data_entery/data/repositories/interfaces/app_data_inferface.dart';
import 'implementation/local_app_data.dart';
import 'implementation/remote_app_data.dart';

class AppDataRepo implements AppDataInterface {
  final LocalAppDataSource _localAppData;
  final RemoteAppDataSource _remoteAppData;
  final ConnectivityResult _connectivityResult;

  AppDataRepo(
      {required LocalAppDataSource localAppData,
      required RemoteAppDataSource remoteAppData,
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
    } catch (error) {}
    return articles;
  }

  @override
  Future<List<Category>> getCategories() async {
    if (_connectivityResult == ConnectivityResult.none) {
      return await _localAppData.getCategories();
    } else {
      return await _remoteAppData.getCategories();
    }
  }

  @override
  Future<List<Section>> getSections() async {
    if (_connectivityResult == ConnectivityResult.none) {
      return await _localAppData.getSections();
    } else {
      return await _remoteAppData.getSections();
    }
  }

  @override
  Future<List<Subsection>> getSubsections() async {
    if (_connectivityResult == ConnectivityResult.none) {
      return await _localAppData.getSubsections();
    } else {
      return await _remoteAppData.getSubsections();
    }
  }
}
