import 'package:ezapplly/Shared/widgets/viewmore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Features/application/application_data.dart';
import '../../Features/application/createapplication/viewApplication.dart';
import '../../Features/newsfeed/news_data.dart';
import '../../Features/services/services_manager.dart';
import 'buttons.dart';

Widget newscard(
    BuildContext context, NEWSDATA newsModel, ColorScheme colorss, Size size) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (newsModel.banner != null)
            SizedBox(
              child: Image.network(
                newsModel.banner!,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 10),
          Text(
            newsModel.title!,
            style: TextStyle(
                fontSize: 14,
                color: colorss.primary,
                fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 10),
          // Text(
          //   "This university have complete admission procedure and all students get admission on pure merit here. ...",
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: colorss.primary,
          //   ),
          // ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              newsButton(colorss, "Apply Now"),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => viewMore(newsModel.description!));
                  },
                  child: const Text(
                    "View More >>",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    ),
  );
}

Widget notificationcard(ColorScheme colorss,
    {RemoteNotification? notification}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Admission Service",
            style: TextStyle(
                fontSize: 14,
                color: colorss.primary,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "43553",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Muhammad Haider",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text:
                        "Dear applicant your application is rejected because our team found some deficiencies in your document Kindly upload your following documents again",
                    style: TextStyle(fontSize: 12)),
                TextSpan(
                  // recognizer: TapGestureRecognizer()..onTap = onpress,
                  text: " Matric result card Inter result card",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
      subtitle: Text(
        "22/01/2022",
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
  );
}

Widget applicationCard(BuildContext context, Size size, ColorScheme colorss,
    APPLICATIONDATA applicationdata) {
  return InkWell(
    onTap: (() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ViewApplication(applicationdata: applicationdata),
          ));
    }),
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "43553",
              style: TextStyle(
                  fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              applicationdata.personaldata!.name!,
              style: TextStyle(
                  fontSize: 14,
                  color: colorss.primary,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              applicationdata.applicationfor!,
              style: TextStyle(fontSize: 14, color: colorss.primary),
            ),
            Text(
              "GCUF Sahiwal",
              style: TextStyle(fontSize: 12, color: colorss.primary),
            ),
          ]),
          subtitle: Text(
            "22/01/2022",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: Column(
            children: [
              Consumer<ServicesManager>(
                builder: (context, value, child) => SizedBox(
                    height: 20,
                    width: size.width / 4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(
                                fontSize: 10,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            foregroundColor: Colors.teal,
                            backgroundColor:
                                Color.fromARGB(255, 144, 221, 194)),
                        onPressed: () {},
                        child: Text("Approved"))),
              ),
            ],
          ),
        )),
  );
}
