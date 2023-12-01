import 'package:doctor_guid_app/data/implementation/local_data_source.dart';
import 'package:doctor_guid_app/models/book.dart';
import 'package:doctor_guid_app/models/topic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Books should be loaded from the local data source', () async {
    final localDataSource = LocalDataSource();

    // Ensure Flutter binding is initialized for tests
    TestWidgetsFlutterBinding.ensureInitialized();

    // Use await to get the result of the asynchronous call
    final books = await localDataSource.getBooks();

    expect(books, [
      Book(
        title: "Internel Medicine Emergency",
        topics: [
          Topic(
            title: "APCDE approach",
            index: [],
            images: [],
          ),
        ],
      ),
    ]);
  });
}
