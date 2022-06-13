import 'package:cloud_firestore/cloud_firestore.dart';

class Notice {
  Timestamp date;
  String head;
  String body;

  Notice(this.date, this.head, this.body);

  // Map<String, String> toJson () => {
  //   'Date' : date,
  //   'Notice' : notice
  // };

  // Notice.fromJson(Map<String, String> json)
  //   : date = json['Date'],
  //     notice = json['Notice'];
}