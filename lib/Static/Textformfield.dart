import 'package:flutter/material.dart';

class Textformfid extends StatelessWidget {
  final String? hint;
  final bool? readonly;
  final int max;
  final Widget? iconhide;
  final Widget? icon2;
  final String? name;
  final TextInputType? type;
  final TextEditingController? mycontroller;
  final bool pass;
  final int? maxLines;
  final String? Function(String?)? valid;
  const Textformfid(
      {Key? key,
      this.readonly: false,
      this.hint,
      this.icon2,
      this.maxLines: 1,
      this.name,
      this.mycontroller,
      required this.type,
      required this.pass,
      this.valid,
      this.iconhide,
      required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        toolbarOptions: ToolbarOptions(copy: true, paste: true),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: valid,
        obscureText: pass,
        keyboardType: type,
        controller: mycontroller,
        textAlign: TextAlign.center,
        cursorColor: Color.fromRGBO(49, 40, 79, 1),
        cursorRadius: Radius.circular(10),
        cursorWidth: 4,
        maxLines: maxLines,
        maxLength: max,
        readOnly: readonly!,
        decoration: InputDecoration(
            filled: true,
            hintText: hint,
            labelText: name,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: icon2,
            suffixIcon: iconhide,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
    );
  }
}
