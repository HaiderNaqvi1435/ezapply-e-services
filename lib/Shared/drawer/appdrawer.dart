import 'package:ezapplly/Shared/drawer/contect.dart';
import 'package:ezapplly/Shared/drawer/privacypolicy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Features/auth/auth_manager.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colorss.primary,
      child: ListView(
        children: [
          Consumer<AuthManager>(
            builder: (context, value, child) => Column(
              children: [
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset("images/ezapply.png")),
                Text(
                  value.userdata.username ?? "",
                  style: TextStyle(
                      fontSize: 18,
                      color: colorss.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  value.userdata.useremail ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: colorss.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[200],
            height: 40,
          ),
          ListTile(
            dense: true,
            onTap: () {},
            iconColor: colorss.secondary,
            textColor: colorss.secondary,
            leading: const Icon(Icons.lightbulb_rounded),
            title: const Text("How to use"),
          ),
          ListTile(
            dense: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContectUs(),
                  ));
            },
            iconColor: colorss.secondary,
            textColor: colorss.secondary,
            leading: const Icon(Icons.mail),
            title: const Text("Contact us"),
          ),
          ListTile(
            dense: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ));
            },
            iconColor: colorss.secondary,
            textColor: colorss.secondary,
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Priacy Policy"),
          ),
          ListTile(
            dense: true,
            onTap: () {},
            iconColor: colorss.secondary,
            textColor: colorss.secondary,
            leading: const Icon(Icons.share),
            title: const Text("Share App"),
          ),
          Consumer<AuthManager>(
            builder: (context, value, child) => ListTile(
              dense: true,
              onTap: value.userSignout,
              iconColor: colorss.secondary,
              textColor: colorss.secondary,
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
