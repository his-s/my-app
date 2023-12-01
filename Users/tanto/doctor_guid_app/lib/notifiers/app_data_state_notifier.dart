import 'package:doctor_guid_app/data/repo/app_data.dart';
import 'package:doctor_guid_app/models/book.dart';
import 'package:doctor_guid_app/models/topic.dart';
import 'package:doctor_guid_app/state/app_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDataStateNotifier extends StateNotifier<AppDataState> {
  final AppDataRepo appDataRepo;
  AppDataStateNotifier(this.appDataRepo) : super(AppDataState.empty());
  List<Topic> _topics = [];
  Future<void> getBooks() async {
    state = state.copyWith(isLoading: true);
    List<Book> books = await appDataRepo.getBooks();
    for (var element in books) {
      for (var element in element.topics) {
        _topics.add(element);
      }
    }
    state = state.copyWith(isLoading: true, books: books, topics: _topics);
  }

  performSearch(String value) {
    state = state.copyWith(
      topics: state.topics
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList(),
    );
    if (value.isEmpty) {
      resetSearch();
    }
  }

  resetSearch() {
    state = state.copyWith(topics: _topics);
  }
}
