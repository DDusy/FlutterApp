import 'package:flutter/material.dart';

class AcademyButton extends StatefulWidget {

  final String msg;

  const AcademyButton({Key? key, required this.msg}) : super(key: key);

  @override
  State<AcademyButton> createState() => _AcademyButtonState(msg);
}

class _AcademyButtonState extends State<AcademyButton> {

  String msg;

  _AcademyButtonState(this.msg);

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
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                        child: Text('과목'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
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
            */
          ],
        ),
      ),
    );
  }
}