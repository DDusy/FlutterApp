import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_reservetable.dart';
import 'package:table_calendar/table_calendar.dart';

class ReserveWidget extends StatefulWidget {
  const ReserveWidget({Key? key}) : super(key: key);

  @override
  State<ReserveWidget> createState() => _ReserveWidgetState();
}

class _ReserveWidgetState extends State<ReserveWidget> {

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  List<String> tmp = [
    "20220611_1500_001",
    "20220611_1600_001",
    "20220611_1800_001",
    "20220611_0900_001",
    "20220611_1000_001",
    "20220611_1400_001",
    "20220611_2000_001",
  ];

  late ReserveTable res;

  @override
  void initState() {
    super.initState();

    res = ReserveTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reserve")),
      body: Column(
        children: [
          TableCalendar(
            locale: 'ko-KR',
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 14)),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.twoWeeks,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: true,
              rightChevronVisible: true,
            ),
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: true,
            ),
            availableGestures: AvailableGestures.none,
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDay);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              padding: const EdgeInsets.all(5),
              children: res.getButtons(),
            ),
          ),
        ],
      ),
    );
  }
}