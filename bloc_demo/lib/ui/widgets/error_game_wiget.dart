import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Somethong was wrong',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
