import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});

  final String hint;
  final int maxLines;
  final void Function(dynamic?)? onSaved;
  final Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
       textAlign: TextAlign.right,
       style: const TextStyle(color: Colors.black54 , fontSize: 20),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.only(right: 30 , top : 30),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular( 8, ),
        borderSide: BorderSide(
          color: color ?? Colors.black45,
        ));
  }
}