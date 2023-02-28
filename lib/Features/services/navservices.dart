import 'package:ezapplly/Features/services/services_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/buttons.dart';

class NavServices extends StatelessWidget {
  const NavServices({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height / 1.2,
          width: size.width / 1.1,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              Consumer<ServicesManager>(
                builder: (context, service, child) => sqrButton(
                    ontap: service.movetoform,
                    colorss: colorss,
                    asset: "images/icons/admission.png",
                    text: "Admission Service"),
              ),
              sqrButton(
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        // title: Text("Alert"),
                        content: Text("This feature will be available soon!"),
                        actions: [
                          newsButton(colorss, "OK", ontap: () {
                            Navigator.pop(context);
                          })
                        ],
                      ),
                    );
                  },
                  colorss: colorss,
                  asset: "images/icons/job.png",
                  text: "Job Vacancies"),
            ],
          ),
        ),
      ),
    );
  }
}
