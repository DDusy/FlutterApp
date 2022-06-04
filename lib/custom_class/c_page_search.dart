import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_academy_simple.dart';
import 'package:myflutterapp/custom_class/c_academybutton.dart';
import 'package:myflutterapp/custom_class/c_inputfield.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  TextEditingController searchController = TextEditingController();
  List<SimpleAcademy> academies = [];
  List<AcademyButton> buttons = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {

    super.setState(fn);
  }

  Future<String> getAcademyData() async {
    var store = FirebaseFirestore.instance;
    var snapshot = await store.collection('Academies').get().then((value) {
      var v = value;

      for (var item in v.docs) {
        var members = item.get('Members');
        var reserve = item.get('Reserve');
        var settings = item.get('Settings');

        academies.add(SimpleAcademy(members, reserve, settings));
      }

      setButtonList();
    });
    return Future(() => 'Complete');
  }

  void setButtonList() {
    for(int i = 0; i<3; ++i){
      for(var item in academies) {
        buttons.add(getAcademyButton(item.settings['Name']));
      }
    }
  }

  ListView getList() {
    return ListView(children: buttons,);
  }

  AcademyButton getAcademyButton(String name) {
    return AcademyButton(msg: name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex:2, 
          child : Column(
            children: [
              InputField(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                hintText: 'Search Academy name',
                controller: searchController,
                type: TextInputType.text
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              const Divider(
                height: 3,
                thickness: 1,
                color: Colors.white
              ),
              const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            ],
          ),
        ),
        Flexible(
          flex:9, 
          child : FutureBuilder(
            future : getAcademyData(),
            builder : (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData == false) {
                return CircularProgressIndicator();
              }
              else if(snapshot.hasError) {
                return Text('error');
              }
              else {
                return getList();
              }      
            },
          )
        ),
      ],
    );

    /*

    */
  }
}