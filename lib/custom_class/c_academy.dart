import 'package:flutter/material.dart';

class academy_button extends StatefulWidget {

  final String msg;

  const academy_button({Key? key, required this.msg}) : super(key: key);

  @override
  State<academy_button> createState() => _academy_buttonState(msg);
}

class _academy_buttonState extends State<academy_button> {

  String msg;

  _academy_buttonState(this.msg);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(msg);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 206, 153, 215), width: 2),
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        margin: const EdgeInsets.all(10),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              //padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 0),
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.only(left:10),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child : Image.asset('icon.png'),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                        child: Text('학원이름'),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                        child: Text('종목'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Expanded(
                  //   child: Padding(
                  //     padding: EdgeInsetsDirectional.only(bottom: 8),
                  //     child: Text(
                  //       '서울특별시 마포구 고산길 156 지하1층 드럼스쿨'
                  //     ),
                  //   ),
                  //),
                  Text('도로명주소'),
                  Text('지번주소'),
                ],
              ),
            ),
            const Divider(
              height: 3,
              thickness: 1,
              color: Color.fromARGB(255, 206, 153, 215)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
              child: Row(
                children: const [
                  Icon(Icons.favorite_rounded, color: Color.fromARGB(255, 206, 153, 215),),
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: Text('좋아요 수'),
                  ),
                  Padding(padding: EdgeInsets.only(left:20)),
                  Icon(Icons.mode_comment_outlined, color: Color.fromARGB(255, 206, 153, 215)),
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: Text('리뷰 수'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}