import 'package:doctor_guid_app/models/book.dart';

abstract class AppDataInterface {
  Future<List<Book>> getBooks();
}
