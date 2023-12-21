import 'package:flutter/material.dart';
class WatchButton extends StatelessWidget {
  String label;
  Color color;
  IconData icon;
  WatchButton({super.key, required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        color: this.color
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(this.icon, color: Colors.white,size: 20,),
          Text(this.label.toString(), style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
