import 'package:ezapplly/Shared/widgets/buttons.dart';
import 'package:ezapplly/Shared/widgets/textinput.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Features/auth/auth_manager.dart';

class ContectUs extends StatelessWidget {
  ContectUs({super.key});

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController massagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Consumer<AuthManager>(
        builder: (context, auth, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Inputtext(labeltext: "Name", controller: namecontroller),
                const SizedBox(height: 12),
                Inputtext(labeltext: "Phone", controller: phocontroller),
                const SizedBox(height: 12),
                Inputtext(labeltext: "Email", controller: emailcontroller),
                const SizedBox(height: 12),
                Inputtext(labeltext: "Subject", controller: subjectcontroller),
                const SizedBox(height: 12),
                Inputtextcontect(
                  hinttext: 'Tell us what we could improve',
                  controller: massagecontroller,
                  maxline: 7,
                ),
                const SizedBox(height: 12.0),
                largeButton(text: 'Contect', colorss: colorss, onpress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
