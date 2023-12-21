import 'package:flutter/material.dart';
class IconBadge extends StatelessWidget {
  String label;
  Color color;
  IconData icon;
  IconBadge({super.key, required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: this.color, spreadRadius: 1)
        ]
      ),
      child: Wrap(
        children: [
          Icon(this.icon, color: Colors.white,size: 10,),
          Text(this.label.toString(), style: TextStyle(color: Colors.white,fontSize: 9)),
        ],
      ),
    );
  }
}
