import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  String label ;
  Color background_color;
  Color text_color;
  bool is_icon;
  Function onClick;
  ButtonItem({super.key,required this.label,required this.onClick,required this.background_color,
    this.text_color = Colors.white,this.is_icon = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onClick(label),
        style: ElevatedButton.styleFrom(
            backgroundColor:background_color,
            padding: EdgeInsets.symmetric(vertical: is_icon? 17: 15),
            shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16))
        ),

        child: is_icon
            ? Icon(
          Icons.backspace_outlined,
          color: Colors.white.withOpacity(0.7),
          size: 24,
        )
            : Text(
          label,
          style: TextStyle(color: text_color.withOpacity(0.8) , fontSize: 25),
        )
    );

  }
}