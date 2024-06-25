
class DaySchedule {
  final String day;
  List<String> schedual;
  List<String> timeslot=[];

  DaySchedule(this.day,this.schedual);

  static List<DaySchedule> Days = [
    DaySchedule('Sun',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Mon',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Tue',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Wed',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Thu',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Fri',["Morning", "Afternoon", "Evening"]),
    DaySchedule('Sat',["Morning", "Afternoon", "Evening"]),

  ];

}

