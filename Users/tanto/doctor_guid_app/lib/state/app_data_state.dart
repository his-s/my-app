import 'package:doctor_guid_app/models/topic.dart';

import '../models/book.dart';

class AppDataState {
  List<Book> books;
  String error;
  bool isLoading;
  List<Topic> topics;
  AppDataState({
    required this.books,
    required this.error,
    required this.isLoading,
    required this.topics,
  });
  AppDataState.empty()
      : books = [],
        error = '',
        isLoading = false,
        topics = [];

  AppDataState copyWith({
    List<Book>? books,
    String? error,
    bool? isLoading,
    List<Topic>? topics,
  }) {
    return AppDataState(
      books: books ?? this.books,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      topics: topics ?? this.topics,
    );
  }
}
