import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Shared/widgets/textinput.dart';
import '../application_manager.dart';

Widget getpersonalInfo(ColorScheme colorss) {
  return Consumer<ApplicationManager>(
    builder: (context, form, child) => Column(
      children: [
        const SizedBox(height: 10),
        Inputtext(labeltext: "Name", controller: form.namecont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Father Name", controller: form.fthrnamecont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "CNIC", controller: form.cniccont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Father's CNIC", controller: form.fthrcniccont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Gender", controller: form.gendercont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "DOB", controller: form.gendercont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Religion", controller: form.religioncont),
        const SizedBox(height: 10),
      ],
    ),
  );
}

Widget getcontactInfo(ColorScheme colorss) {
  return Consumer<ApplicationManager>(
    builder: (context, manager, child) => Column(
      children: [
        const SizedBox(height: 10),
        Inputtext(labeltext: "Phone", controller: manager.phonecont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Father Phone", controller: manager.fthrphonecont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Email", controller: manager.emailcont),
        const SizedBox(height: 10),
        Inputtext(
            labeltext: "Nationality", controller: manager.nationalitycont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Domicile", controller: manager.domicilecont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Address", controller: manager.addresscont),
        const SizedBox(height: 10),
      ],
    ),
  );
}

Widget getapplyingInfo(ColorScheme colorss) {
  return Consumer<ApplicationManager>(
    builder: (context, manager, child) => Column(
      children: [
        const SizedBox(height: 10),
        Inputtext(labeltext: "University", controller: manager.unicont),
        const SizedBox(height: 10),
        Inputtext(labeltext: "Program", controller: manager.programcont),
        const SizedBox(height: 10),
      ],
    ),
  );
}

Widget getacademicInfo() {
  return Column(
    children: [
      const SizedBox(height: 10),
      Inputtext(labeltext: "Examination"),
      const SizedBox(height: 10),
      Inputtext(labeltext: "Board/University"),
      const SizedBox(height: 10),
      Inputtext(labeltext: "Passing year"),
      const SizedBox(height: 10),
      Inputtext(labeltext: "Roll no"),
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(child: Inputtext(labeltext: "Obtain marks")),
          const SizedBox(width: 10),
          Expanded(child: Inputtext(labeltext: "Total marks")),
        ],
      ),
      const SizedBox(height: 10),
      ElevatedButton(onPressed: () {}, child: Text("Add")),
    ],
  );
}

Widget getDocs(ColorScheme colorss, Size size) {
  return Consumer<ApplicationManager>(
    builder: (context, manager, child) => Column(
      children: [
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: manager.doctitle,
            // onChanged: onChanged,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: "Document Title",
              prefixIcon: IconButton(
                  onPressed: manager.pickdoc,
                  icon: const Icon(
                    Icons.upload_file_rounded,
                  )),
              suffixIcon: IconButton(
                  onPressed: manager.addDoctoList,
                  icon: const Icon(Icons.send_rounded)),

              isDense: true,
              contentPadding: const EdgeInsets.all(10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              // labelText: labeltext,
              // hintText: hinttext,
            ),
          ),
        ),
        SizedBox(
          height: size.height / 2,
          child: ListView.builder(
            itemCount: manager.docslist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  dense: true,
                  title: Text(manager.docslist[index].documnetTitle!),
                  leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.file(manager.docslist[index].documnetfile!)),
                  trailing: IconButton(
                    onPressed: () {
                      manager.deleteDocfromList(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ));
            },
          ),
        ),
      ],
    ),
  );
}
// showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: AspectRatio(
//                     aspectRatio: 1,
//                     // child: Image.asset(
//                     //   "images/ss.png",
//                     //   fit: BoxFit.cover,
//                     // ),
//                     child: InkWell(
//                       onTap: () {
//                         manager.pickdoc();
//                       },
//                       child: manager.docimage != null
//                           ? Image.file(manager.docimage!)
//                           : Card(
//                               color: colorss.primary,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.upload_file_rounded,
//                                     color: colorss.secondary,
//                                     size: 60,
//                                   ),
//                                   Text(
//                                     "Select Document",
//                                     style: TextStyle(
//                                       color: colorss.onPrimary,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                     ),
//                   ),
//                   content: Inputtext(
//                       labeltext: "Document Title",
//                       controller: manager.doctitle),
//                   elevation: 5,
//                   actions: [
//                     newsButton(colorss, "Done", ontap: manager.addDoctoList),
//                   ],
//                 ),
//               );