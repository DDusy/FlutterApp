import 'package:flutter/material.dart';

//import 'package:myflutterapp/custom_class/c_academy.dart';
import 'package:myflutterapp/custom_class/c_page_favorited.dart';
import 'package:myflutterapp/custom_class/c_welcometext.dart';
import 'package:myflutterapp/custom_class/c_user.dart';

class MainPage extends StatefulWidget {

  final CustomUser user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(user);
}

class _MainPageState extends State<MainPage> {

  CustomUser user;

  _MainPageState(this.user) {
    getDB();
  }

  void getDB() async {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //appBar: AppBar(title: Text('HI')),
          //appBar: welcomeText(userName: 'Y.HOLICS', email: 'Yholics@younha.forever'),

          // body: Column(
        //   children: [
        //     //welcomeText(userName: user.name, email:user.email),
        //     welcomeText(userName: 'Y.HOLICS', email: 'Yholics@younha.forever',),
        //     //welcomeText(userName: 'NAGA', email: 'NAGA@BADA.MANYEO',),
        //     TabBar(
        //       isScrollable: false, //true,
        //       labelColor: Colors.purple,
        //       unselectedLabelColor: Color.fromARGB(255, 149, 161, 172),
        //       indicatorColor: Colors.purple,
        //       indicatorWeight: 5,
        //       tabs: const [
        //         Tab(
        //           text: '즐겨찾는 학원',
        //         ),
        //         Tab(
        //           text: '학원 검색',
        //         ),
        //       ],
        //     ),
        //     Expanded(
        //       child: TabBarView(
        //         children: [
        //           ListView(
        //             children: [
        //               academy_button(msg: 'Hello'),
        //               academy_button(msg: 'My'),
        //               academy_button(msg: 'Name'),
        //               academy_button(msg: 'Is'),
        //               academy_button(msg: 'GimDonGuk'),
        //             ],
        //           ),
        //           const Text('sample'),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                // personal info
                Flexible(
                  //child: welcomeText(userName: user.name, email: user.email),
                  child: welcomeText(userName: 'Y.HOLICS', email: 'Yholics@younha.forever'),
                  flex: 2,
                ),
                
                // tabbarview
                Flexible(
                  child: TabBarView(
                    children: [
                      // tab 1
                      FavoritedWidget(),

                      // tab2
                      Text('search page'),

                      // tab3
                      Text('privacy page'),
                    ],
                  ),
                  flex: 10
                ),
              ],
            ),
          ),

          bottomNavigationBar: Container(
            color: Color.fromARGB(255,189,103,204),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(bottom: 10),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.purple,
                indicatorWeight: 6,
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromARGB(255, 54, 54, 54),
                labelStyle: TextStyle(
                  fontSize: 10,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.favorite_rounded,
                      size: 20,
                    ),
                    //text: '즐겨찾기',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    //text: '검색',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20,
                    ),
                    //text: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
