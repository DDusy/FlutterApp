import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_labeltabbar.dart';
import 'package:myflutterapp/pages/acdemey_info_image.dart';
//import 'package:myflutterapp/pages/acdemey_info_reservation';
//import 'package:myflutterapp/pages/acdemey_info_reView';

import 'acdemey_info_Inform.dart';

final Item = {
  Image.asset('assets/icon.png', width: 10, height: 10),
  Image.asset('assets/icon.png', width: 10, height: 10),
  Image.asset('assets/icon.png', width: 10, height: 10),
};

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("학원 이름"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          ImageSliderPage(imagelist: Item, height: 150),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TabBar(
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const LabelTabbar(
                    label: Text('정보', style: TextStyle(fontSize: 20)),
                    height: 80),
                const LabelTabbar(
                    label: Text('예약', style: TextStyle(fontSize: 20)),
                    height: 80),
                const LabelTabbar(
                    label: Text('리뷰', style: TextStyle(fontSize: 20)),
                    height: 80),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const TabInform(),
                Container(
                  color: Colors.green[200],
                  alignment: Alignment.center,
                  child: const Text(
                    'Tab2 View',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[200],
                  alignment: Alignment.center,
                  child: const Text(
                    'Tab3 View',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
