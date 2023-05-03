import 'package:flutter/material.dart';

Widget Inputtext(
    {String? hinttext,
    String? labeltext,
    final validate,
    void Function(String)? onChanged,
    TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    validator: validate,
    onChanged: onChanged,
    style: const TextStyle(fontSize: 14),
    decoration: InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      labelText: labeltext,
      hintText: hinttext,
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}

Widget Inputtextcontect(
    {String? hinttext,
    String? labeltext,
    final maxline,
    void Function(String)? onChanged,
    TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    // ignore: prefer_if_null_operators
    maxLines: maxline == null ? null : maxline,
    // onChanged: onChanged,
    style: const TextStyle(fontSize: 14),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      labelText: labeltext,
      hintText: hinttext,
    ),
  );
}
