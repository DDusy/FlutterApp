import 'package:flutter/material.dart';

class welcomeText extends StatelessWidget {

  final String userName;

  const welcomeText({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,//MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 30,
                    // color: Theme.of(context).primaryColor,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 4)),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,//Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            //Divider(height: 3, thickness: 1, color: Color.fromARGB(255, 0, 0, 0)),
            const Padding(padding: EdgeInsets.fromLTRB(4, 10, 0, 0)),
            Text('Welcome to Application'),
          ],
        ),
      ),
    );
  }
}
