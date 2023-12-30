import 'package:flutter/material.dart';
import 'package:project/Model/CatgoryHomeModel.dart';

class Imagecatgory extends StatelessWidget {
  const Imagecatgory({Key? key, required this.categormodel}) : super(key: key);
  final CategoryModel categormodel;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/${categormodel.picture}",
      width: 165,
      height: 170,
      fit: BoxFit.fill,
    );
  }
}
