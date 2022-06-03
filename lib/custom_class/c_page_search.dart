import 'package:flutter/material.dart';
import 'package:myflutterapp/custom_class/c_inputfield.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}