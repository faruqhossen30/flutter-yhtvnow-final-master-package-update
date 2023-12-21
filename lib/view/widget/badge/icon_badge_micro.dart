import 'package:flutter/material.dart';
class IconBadgeMicro extends StatelessWidget {
  String label;
  Color color;
  IconData icon;
  IconBadgeMicro({super.key, required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 3),
      decoration: BoxDecoration(
        border: Border.all(color:Colors.amber),
          borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.amber, Colors.yellowAccent, Colors.amber]),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(this.icon, color: Colors.black,size: 6,),
          Text(this.label.toString(), style: TextStyle(color: Colors.black,fontSize: 6,fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
