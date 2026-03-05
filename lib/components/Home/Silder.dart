import 'package:flutter/material.dart';

class Silder extends StatefulWidget {
  Silder({Key? key}) : super(key: key);

  @override
  _SilderState createState() => _SilderState();
}

class _SilderState extends State<Silder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('轮播图', style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
