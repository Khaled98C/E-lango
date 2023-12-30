import 'package:flutter/material.dart';

class dot extends StatelessWidget {
  dot({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  Color primaryColor = Color.fromARGB(255, 85, 5, 89);
  Color second = Color(0xffc385c7);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 10),
        height: isActive ? 12 : 10,
        width: isActive ? 35 : 25,
        decoration: BoxDecoration(
            color: isActive ? primaryColor : second.withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
