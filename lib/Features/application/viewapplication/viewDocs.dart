import 'package:flutter/material.dart';

import '../formModels/document_data.dart';

Widget viewDocument(ColorScheme colorss, DOCUMENTDATA documentdata) {
  // final colorss = Theme.of(context).colorScheme;

  TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;
  return Container(
    decoration: BoxDecoration(color: colorss.primary),
    child: Column(
      children: [
        const SizedBox(height: 10),
        Text(
          documentdata.documnetTitle!,
          style: TextStyle(
              color: colorss.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onDoubleTapDown: ((details) => tapDownDetails = details),
          onDoubleTap: (() {
            final double scale = 3;

            final postition = tapDownDetails!.localPosition;
            final x = -postition.dx * (scale - 1);
            final y = -postition.dy * (scale - 1);
            final zoomed = Matrix4.identity()
              ..translate(x, y)
              ..scale(scale);
            final value =
                controller.value.isIdentity() ? zoomed : Matrix4.identity();
            controller.value = value;
          }),
          child: InteractiveViewer(
              transformationController: controller,
              clipBehavior: Clip.none,
              panEnabled: false,
              scaleEnabled: false,
              child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(documentdata.documnetUrl!))),
        ),
      ],
    ),
  );

  // AspectRatio(aspectRatio: 1, child: Image.asset("images/ADS.png"));
}
