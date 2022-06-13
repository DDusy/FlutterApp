import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_notice.dart';

class NoticeWidget extends StatefulWidget {
  const NoticeWidget({Key? key}) : super(key: key);

  @override
  State<NoticeWidget> createState() => _NoticeWidgetState();
}

class _NoticeWidgetState extends State<NoticeWidget> {

  List<Widget> tiles = [];
  List<Notice> notices = [];

  void setNoticeList() {
    for(var item in notices) {
      tiles.add(ExpansionTile(
        title: Text(item.head),
        subtitle: Text(item.date.toDate().toString()),
        textColor: Color.fromARGB(255, 222, 167, 232),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(title: Text(item.body)),
            ],
          ),
        ],
      ));

      tiles.add(Divider(color: Colors.grey, height: 1, thickness: 3,));
    }
  }

  Future<String> getNotice() async {

    Notice notice;

    var store = FirebaseFirestore.instance;
    var query = await store.collection("Notice").orderBy("TimeStamp", descending: true).get().then((value) {
      for(var item in value.docs) {
        notice = Notice(
          item.data()["TimeStamp"],
          item.id,
          item.data()["NoticeBody"]
        );
        notices.add(notice);
      }

      setNoticeList();
    },);

    return Future(() => 'Success');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNotice(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData == false) {
          return const Text("Loading");
        }
        else if(snapshot.hasError) { 
          return const Text("Error");
        }
        else {
          return Scaffold(
            body: ListView(
              children: tiles
            )
          );
        }
      },
    );
  }
}