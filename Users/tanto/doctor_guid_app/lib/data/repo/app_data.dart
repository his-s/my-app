import 'package:doctor_guid_app/data/implementation/local_data_source.dart';
import 'package:doctor_guid_app/data/interfaces/app_data_interface.dart';
import 'package:doctor_guid_app/models/book.dart';

class AppDataRepo implements AppDataInterface {
  final LocalDataSource _localDataSource;

  AppDataRepo({required LocalDataSource localDataSource})
      : _localDataSource = localDataSource;
  @override
  Future<List<Book>> getBooks() async {
    return await _localDataSource.getBooks();
  }
}
