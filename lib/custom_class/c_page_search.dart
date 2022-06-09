import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_academy_simple.dart';
import 'package:myflutterapp/custom_class/c_academybutton.dart';
import 'package:myflutterapp/custom_class/c_debouncer.dart';
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
  final Debouncer _debouncer = Debouncer(1000);

  @override
  void initState() {

    searchController.addListener(onSearchChanged);

    super.initState();
  }

  @override void dispose() {

    searchController.dispose();

    super.dispose();
  }

  Future<String> getAcademyData() async {
    var store = FirebaseFirestore.instance;
    var snapshot = await store.collection('Academies').get().then((value) {
      var v = value;

      for (var item in v.docs) {
        var name = item.get('Name');
        var members = item.get('Members');
        var reserve = item.get('Reserve');
        var settings = item.get('Settings');
        var searchlist = item.get('SearchList');

        academies.add(SimpleAcademy(name, members, reserve, settings, searchlist));
      }

      setButtonList();
    });
    return Future(() => 'Complete');
  }

  void setButtonList() {
    for (var item in academies) {
      buttons.add(getAcademyButton(item.name));
    }
  }

  ListView getList() {
    return ListView(children: buttons,);
  }

  AcademyButton getAcademyButton(String name) {
    return AcademyButton(msg: name);
  }

  void onSearchChanged() {

    print("Enter onSearchChanged");

    _debouncer.run( () => makeQuery(searchController.text) );
  }

  Future<void> makeQuery(String text) async { 

    if (text == "")
      return;


    print("Enter onSearchChanged");

    var store = FirebaseFirestore.instance;

    //String queryText = "%" + text + "%";

    //var query = await store.collection("Academies").startAt(queryText);
    
    //var query = await store.collection("Academies").get();
    // for (var item in query.docs) {
    //   print(item.data()["Settings"]);
    // }

    var query = await store.collection("Academies").where("SearchList", arrayContains: text).get().then((value) {
      if(value.docs.isEmpty == true) {
        print("value is null");
        return;
      }

      for (var item in value.docs) {
        print(item.data()["Name"]);
      }
    },);
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
                type: TextInputType.text,
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