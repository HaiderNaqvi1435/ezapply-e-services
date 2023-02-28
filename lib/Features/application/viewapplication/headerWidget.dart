import 'package:flutter/material.dart';

Widget header(Color primary) {
  return ListTile(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: TextStyle(
              color: primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          "03001451435",
          style: TextStyle(color: primary, fontSize: 12),
        ),
        Text(
          "haidernaqvi1435@gmail.com",
          style: TextStyle(color: primary, fontSize: 12),
        ),
      ],
    ),
    trailing: Container(
      height: 60,
      width: 60,
      color: primary,
    ),
  );
}
