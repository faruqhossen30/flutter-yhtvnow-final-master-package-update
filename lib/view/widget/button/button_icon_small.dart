import 'package:flutter/material.dart';
import 'package:yhtvnow/const/color.dart';

class ButtonIconSmall extends StatelessWidget {
  String label;
  IconData icon;
  Color color;
  VoidCallback callBack;

  ButtonIconSmall({super.key, required this.label, required this.icon, required this.color, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: yellowColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
      ),
      onPressed: callBack,
      icon: Icon(
        this.icon,
        color: this.color,
        size: 12,
      ),
      label: Text(
        this.label,
        style: TextStyle(color: this.color, fontSize: 10),
      ),
    );
  }
}
