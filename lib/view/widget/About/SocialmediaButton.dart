import 'package:flutter/material.dart';

class Socialmedia extends StatelessWidget {
  const Socialmedia({Key? key,required this.color, required this.icon, this.onPressed}) : super(key: key);
  final Color color;
  final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onPressed,
      icon: Icon(
        icon,
        color: color,
        size: 50,
      ),
    );
  }
}
