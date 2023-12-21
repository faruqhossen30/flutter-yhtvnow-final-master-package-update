import 'package:flutter/material.dart';
import 'package:yhtvnow/const/color.dart';

class ButtonSmall extends StatelessWidget {
  String label;
  Color color;
  VoidCallback callBack;

  ButtonSmall({super.key, required this.label, required this.color, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: yellowColor
      ),
      onPressed: this.callBack,
      child: Text(this.label, style: TextStyle(color: this.color, fontSize: 10)),
    );
  }
}
