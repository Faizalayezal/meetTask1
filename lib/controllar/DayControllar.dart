import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/DaysData.dart';

class Daycontrollar extends ChangeNotifier {
  List<String> selectedDats = [];
  String daysData = "";

  List<DaySchedule> get itemsList => DaySchedule.Days;

  void refreshData() {
    notifyListeners();
  }

  String totalDaysCount() {
    List<String> availableDays = [];

    for (var day in itemsList) {
      if (day.timeslot.isNotEmpty) {
        selectedDats = day.timeslot;
        availableDays.add('${day.day} ${day.timeslot.join(', ')}');
      }
    }

    if (availableDays.isEmpty) return "You haven't set your availability Time.";

    return 'Hi, you are available on ${availableDays.join(', ')}.';
  }
}

final itemsAddProvider = ChangeNotifierProvider((ref) => Daycontrollar());
