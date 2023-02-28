import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application_manager.dart';

class ApplicationForm extends StatelessWidget {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colorss = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        titleSpacing: 1,
        titleTextStyle: TextStyle(
            fontSize: 18, color: colorss.primary, fontWeight: FontWeight.bold),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: colorss.primary,
        title: const Text("Form"),
      ),
      body: Consumer<ApplicationManager>(
          builder: (context, form, child) => CoolStepper(
                contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                config: CoolStepperConfig(
                    titleTextStyle:
                        TextStyle(color: colorss.primary, fontSize: 12),
                    subtitleTextStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    headerColor: Theme.of(context).scaffoldBackgroundColor,
                    iconColor: colorss.primary,
                    backText: "BACK"),
                steps: form.getSteps(),
                onCompleted: form.submitApplication,
              )),

      // body: SingleChildScrollView(
      //   child: Center(
      //     child: SizedBox(
      //       width: size.width / 1.3,
      //       child: Consumer<FormsManager>(
      //         builder: (context, value, child) => Column(
      //           children: [
      //             SizedBox(height: 50),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // bottomSheet: Consumer<FormsManager>(
      //   builder: (context, value, child) => Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Expanded(
      //         child: Card(
      //             elevation: 5,
      //             child: SizedBox(
      //                 height: 40,
      //                 child: TextButton(
      //                     onPressed: value.back, child: Text("Back")))),
      //         // child: largeButton(
      //         //   colorss: colorss,
      //         //   text: "Back",
      //         //   onpress: value.next,
      //         //   // onpress: (() {
      //         //   //   Navigator.push(
      //         //   //       context,
      //         //   //       MaterialPageRoute(
      //         //   //           builder: (context) => const AdmissionForm2()));
      //         //   // })
      //         // ),
      //       ),
      //       const SizedBox(width: 10),
      //       Expanded(
      //         child: largeButton(
      //           colorss: colorss,
      //           text: "Next",
      //           onpress: value.next,
      //           // onpress: (() {
      //           //   Navigator.push(
      //           //       context,
      //           //       MaterialPageRoute(
      //           //           builder: (context) => const AdmissionForm2()));
      //           // })
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
