import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_global.dart';

class ReserveButton extends StatefulWidget {

  final DateTime time;

  const ReserveButton({Key? key, required this.time}) : super(key: key);

  @override
  State<ReserveButton> createState() => _ReserveButtonState(time);
}

class _ReserveButtonState extends State<ReserveButton> {

  DateTime time;

  _ReserveButtonState(this.time);

  void printTime() {
    print(time);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: printTime,
      child: Text(
        time.hour >= 10 ? "${time.hour}:00 ~ ${time.hour+1}:00" : 
          time.hour == 9 ? "0${time.hour}:00 ~ ${time.hour+1}:00" :
          "0${time.hour}:00 ~ 0${time.hour+1}:00" 
      ),
    );
  }
}

class ReserveTable {

  DateTime day;
  int open, close;

  late List<Widget> buttons;

  ReserveTable() :
    day = DateTime(2022,6,1),
    // 학원 정보 받아와서 데이터 세팅
    open = 6,
    close = 22 {

    generateButtons();
    
  }

  void generateButtons() {
      buttons = List.generate(close - open + 1, (index) => ReserveButton(
        time: DateTime(
          day.year,
          day.month,
          day.day,
          open + index, 0)), growable: false);
  }

  void refreshData(List<String> reserves) {
    buttons.clear();

    generateButtons();
  }

  List<Widget> getButtons() {
    return buttons;
  }

  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' + '${invocation.memberName}');
  }
}