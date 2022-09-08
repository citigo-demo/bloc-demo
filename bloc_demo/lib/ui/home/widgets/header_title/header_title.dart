import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Welcome Vảng Thào',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            const SizedBox(height: 8.0),
            Text(
              'What would you like to play?',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
            )
          ],
        ),
        const SizedBox(height: 16.0),
        CircleAvatar(
          radius: 35,
          backgroundImage:
              NetworkImage('http://clipart-library.com/images/rcnr54kei.png'),
        )
      ],
    );
  }
}
