import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/navcards.dart';
import 'application_manager.dart';

class NavApplications extends StatelessWidget {
  const NavApplications({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;

    return Scaffold(
        body: Consumer<ApplicationManager>(
      builder: (context, manager, child) => Center(
        child: manager.applicationdatalist.isEmpty
            ? Text("No Applicaitons")
            : SizedBox(
                width: size.width / 1.1,
                height: size.height / 1.2,
                child: ListView.builder(
                  itemCount: manager.applicationdatalist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return applicationCard(context, size, colorss,
                        manager.applicationdatalist[index]);
                  },
                ),
              ),
      ),
    ));
  }
}
