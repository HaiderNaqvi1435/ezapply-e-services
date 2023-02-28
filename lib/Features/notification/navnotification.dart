import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/navcards.dart';
import 'notification_manager.dart';

class NavNotifications extends StatelessWidget {
  const NavNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
    bool avail = false;
    return Scaffold(
      body: Center(
        child: avail == false
            ? Text("This feature will be available soon")
            : SizedBox(
                width: size.width / 1.1,
                height: size.height / 1.2,
                child: Consumer<NotifcationManager>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.messagelist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return notificationcard(colorss,
                          notification: value.messagelist[index]);
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
