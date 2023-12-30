import 'package:flutter/material.dart';

class Textformfiddate extends StatelessWidget {
 
  final String? hint;
  final Widget? icon2;
  final String? name;
  
  final TextEditingController mycontroller;

  final TextStyle a;
  final String? Function(String?) valid;
  Textformfiddate(
      {Key? key,
      this.hint,
      this.icon2,
      this.name,
      required this.mycontroller,
      required this.valid,
      required this.a,
      
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
       
      
        toolbarOptions: ToolbarOptions(copy: true, paste: true),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: valid,
        controller: mycontroller,
        textAlign: TextAlign.center,
        cursorColor: Color.fromRGBO(49, 40, 79, 1),
        cursorRadius: Radius.circular(10),
        cursorWidth: 4,
        decoration: InputDecoration(
            prefixIconColor: Color(0xffa53ff9),
            iconColor: Color(0xffa53ff9),
            filled: true, //<-- SEE HER
            fillColor: Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
            //Color.fromRGBO(49, 40, 79, 1).withOpacity(0.1),
            hintText: hint,
            labelText: name,
            prefixIcon: icon2,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
