import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Features/application/navapplications.dart';
import '../Features/chat/navchat.dart';
import '../Features/newsfeed/navhome.dart';
import '../Features/notification/navnotification.dart';
import '../Features/notification/notification_manager.dart';
import '../Features/services/navservices.dart';
import 'drawer/appdrawer.dart';

class MyNavBar extends StatelessWidget {
  MyNavBar({super.key});
  double navRadius = 15;

  final pages = [
    const NavHome(),
    const NavApplications(),
    const NavServices(),
    const NavNotifications(),
    NavChat(),
  ];
  // String barTitle = "Ezapply";

  List<String> bartitle = [
    "Ezapply",
    "My applicaitons",
    "Services",
    "Notifications",
    "Chat",
  ];
  List<BottomNavigationBarItem> navbaritems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.school), label: "My applications"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.grid_view), label: "Services"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: "Notifications"),
    const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat"),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotifcationManager>(context);

    final colorss = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          toolbarHeight: 50,
          titleSpacing: 1,
          titleTextStyle: TextStyle(
              fontSize: 18,
              color: colorss.primary,
              fontWeight: FontWeight.bold),
          // shape: Border(
          //   bottom: BorderSide(
          //       color: currentIndex != 1 | 3
          //           ? Colors.transparent
          //           : Colors.grey.shade300),
          // ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          foregroundColor: colorss.primary,
          title: Text(bartitle[provider.currentIndex]),
          actions: [
            // Consumer<NotifcationManager>(
            //   builder: (context, value, child) => IconButton(
            //       onPressed: value.getMessage, icon: Icon(Icons.get_app)),
            // )
          ],
        ),
        body: pages[provider.currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(navRadius),
              topRight: Radius.circular(navRadius)),
          child: BottomNavigationBar(
              onTap: provider.getIndex,
              currentIndex: provider.currentIndex,
              iconSize: 20,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.onPrimary,
              unselectedItemColor: Colors.grey[600],
              type: BottomNavigationBarType.fixed,
              items: navbaritems),
        ),
      ),
    );
  }
}
// class MyNavBar extends StatefulWidget {
//   MyNavBar({super.key});

//   @override
//   State<MyNavBar> createState() => _MyNavBarState();
// }

// class _MyNavBarState extends State<MyNavBar> {
  

//   @override
//   Widget build(BuildContext context) {

//     return 
//   }
// }
