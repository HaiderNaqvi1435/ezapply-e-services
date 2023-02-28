import 'package:flutter/material.dart';

Widget personalInfo(Color primary, String label, String value) {
  return ListTile(
    dense: true,
    // shape: RoundedRectangleBorder(
    //     side: BorderSide(
    //   color: primary,
    //   width: 2,
    // )),
    title: Text(
      label,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ),
    trailing: Text(
      value,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primary),
    ),
  );
}
