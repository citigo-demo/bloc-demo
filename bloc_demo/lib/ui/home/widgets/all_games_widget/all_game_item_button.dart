import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllGameItemButton extends StatelessWidget {
  final VoidCallback callback;

  AllGameItemButton({required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: 65.0,
        height: 30.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.amberAccent),
        child: Text(
          'View more',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
