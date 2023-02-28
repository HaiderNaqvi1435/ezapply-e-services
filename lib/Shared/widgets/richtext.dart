import 'package:ezapplly/Shared/widgets/dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget richtext({
  required String text1,
  required String text2,
  required BuildContext context,
  VoidCallback? onpress,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(text: text1, style: const TextStyle(fontSize: 12)),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onpress,
          text: text2,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Theme.of(context).colorScheme.primary),
        ),
      ],
    ),
  );
}

Widget richtext1({
  required String text1,
  required String text2,
  required String text3,
  required BuildContext context,
  VoidCallback? onpress,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // showdialog(context,
              //     'This is an and I like piña coladas. the rain…or something like by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like . It’s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this Hi there Im a bike messenger by day, aspiring actor by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like It’s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this Hi there Im a bike messenger by day, aspiring actor by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like');
              showDialog(
                  context: context,
                  builder: (context) {
                    return PolicyDialog(
                      mdFileName: 'terms_condition.md',
                      radius: 9,
                    );
                  });
            },
          text: text1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Theme.of(context).colorScheme.primary),
        ),
        TextSpan(text: text2, style: const TextStyle(fontSize: 12)),
        TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // showdialog(context,
              //     'This is an and I like piña coladas. the rain…or something like by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like . It’s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this Hi there Im a bike messenger by day, aspiring actor by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like It’s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this Hi there Im a bike messenger by day, aspiring actor by night and  my website I live in Los Angeles have a great dog named Jack, and I like piña coladas. And gettin caught in the rain…or something like');
              showDialog(
                  context: context,
                  builder: (context) {
                    return PolicyDialog(
                      mdFileName: 'privacy_policy.md',
                      radius: 9,
                    );
                  });
            },
          text: text3,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Theme.of(context).colorScheme.primary),
        ),
      ],
    ),
  );
}
