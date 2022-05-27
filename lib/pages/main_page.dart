import 'package:flutter/material.dart';

import 'package:myflutterapp/custom_class/c_academy.dart';
import 'package:myflutterapp/custom_class/c_welcometext.dart';
import 'package:myflutterapp/custom_class/c_user.dart';

class main_page extends StatefulWidget {

  final customUser user;

  const main_page({Key? key, required this.user}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState(user);
}

class _main_pageState extends State<main_page> {

  customUser user;

  _main_pageState(this.user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        //appBar: AppBar(title: Text('Hi')),
        body: Column(
          children: [
            //welcomeText(userName: user.name, email:user.email),
            welcomeText(userName: 'Y.HOLICS', email: 'Yholics@younha.forever',),
            //welcomeText(userName: 'NAGA', email: 'NAGA@BADA.MANYEO',),
            TabBar(
              isScrollable: false, //true,
              labelColor: Colors.purple,
              unselectedLabelColor: Color.fromARGB(255, 149, 161, 172),
              indicatorColor: Colors.purple,
              indicatorWeight: 5,
              tabs: const [
                Tab(
                  text: '즐겨찾는 학원',
                ),
                Tab(
                  text: '학원 검색',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      academy_button(msg: 'Hello'),
                      academy_button(msg: 'My'),
                      academy_button(msg: 'Name'),
                      academy_button(msg: 'Is'),
                      academy_button(msg: 'GimDonGuk'),
                    ],
                  ),
                  const Text('sample'),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
