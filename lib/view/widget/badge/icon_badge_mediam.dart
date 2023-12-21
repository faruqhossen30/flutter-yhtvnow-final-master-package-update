import 'package:flutter/material.dart';
class IconBadgeMediam extends StatelessWidget {
  String label;
  Color color;
  IconData icon;
  IconBadgeMediam({super.key, required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        color: this.color,
        boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: .4,blurRadius: .5)
        ]
      ),
      child: Wrap(
        spacing: 5,
        children: [
          Icon(this.icon, color: Colors.white,size: 14,),
          Text(this.label.toString(), style: TextStyle(color: Colors.white,fontSize: 12)),
        ],
      ),
    );
  }
}
