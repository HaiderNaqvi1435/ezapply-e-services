import 'package:flutter/material.dart';

Widget largeButton({
  bool loading = false,
  required String text,
  required ColorScheme colorss,
  VoidCallback? onpress,
}) {
  return SizedBox(
    height: 40,
    width: double.maxFinite,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: colorss.secondary,
        ),
        onPressed: onpress,
        child: loading
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(text)),
  );
}

Widget sqrButton(
    {required ColorScheme colorss,
    required String text,
    VoidCallback? ontap,
    required String asset}) {
  return InkWell(
    onTap: ontap,
    child: Card(
      elevation: 5,
      color: colorss.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                asset,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: colorss.onPrimary),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget newsButton(ColorScheme colorss, String text, {VoidCallback? ontap}) {
  return SizedBox(
    height: 25,
    width: 75,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorss.secondary,
          textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          padding: EdgeInsets.zero,
          // fixedSize: Size(80, 20)),
        ),
        onPressed: ontap,
        child: Text(text)),
  );
}
