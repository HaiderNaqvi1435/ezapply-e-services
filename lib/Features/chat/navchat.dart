import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import 'chat_manager.dart';
import 'messagewidgets.dart';
import 'messege_data.dart';

class NavChat extends StatelessWidget {
  NavChat({super.key});

  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Consumer<ChatManager>(
          builder: (context, value, child) => Column(
            children: [
              Expanded(
                  child: GroupedListView<MESSAGEDATA, DateTime>(
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      useStickyGroupSeparators: true,
                      floatingHeader: true,
                      elements: value.messageList,
                      groupBy: ((message) {
                        DateTime dateTime = message.dateTime.toDate();
                        return DateTime(
                            dateTime.day, dateTime.month, dateTime.year);
                      }),
                      groupHeaderBuilder: (MESSAGEDATA message) =>
                          messageHeader(message, context),
                      itemBuilder: (context, MESSAGEDATA message) =>
                          messageBubble(message, context, colorss))),
              const SizedBox(height: 10),
              newMessage(context, colorss, size),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
