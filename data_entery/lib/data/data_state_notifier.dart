import 'dart:convert';
import 'dart:developer';

import 'package:data_entery/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppData extends ChangeNotifier {
  List<Medical> medicals = [];
  List<MedicalContent> contents = [];
  List<MedicalContent> searched = [];

  bool isLoading = false;
  loadJsonFromAsset(String fileName) async {
    isLoading = true;
    // Load the JSON file
    String jsonString = await rootBundle.loadString('assets/$fileName.json');

    // Decode the JSON string into a Map
    List<dynamic> jsonList = json.decode(jsonString);

    medicals = List.from(jsonList.map((e) => Medical.fromMap(e)));
    // log(medicals.toString());
    loadTopics();
    notifyListeners();
    isLoading = false;
  }

  loadTopics() {
    medicals.forEach((element) {
      element.sections.forEach((i) {
        i.sections.forEach((e) {
          contents.add(e);
        });
      });
    });
    contents.sort((a, b) => b.title.compareTo(a.title));
    searched = contents;
    notifyListeners();
  }

  updateSearch(String data) {
    searched = searched
        .where((element) =>
            element.title.toLowerCase().contains(data.toLowerCase()))
        .toList();
    if (data.isEmpty) {
      searched = contents;
    }
    notifyListeners();
  }
}

final appDataProvider = ChangeNotifierProvider<AppData>((ref) {
  return AppData();
});
