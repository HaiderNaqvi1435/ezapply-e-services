import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:keep_tasks/Core/Classes/Themes/Utils.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter your Email",
                // style: Utils.normalText(size: 16),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailCont,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid email";
                  } else
                    null;
                },
                // decoration: Utils.myTextField(label: "Email"),
                decoration: InputDecoration(label: Text('Email')),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   minimumSize: Size.fromHeight(50),
                  // ),
                  onPressed: verifyEmail,
                  child: const Text(
                    "Reset Password",
                  )),
            ],
          ),
        ),
      ),
    );
  }

  verifyEmail() async {
    formKey.currentState!.validate();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailCont.text.toLowerCase().trim());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email sent successfully!")));
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      Navigator.of(context).pop();
    }
  }
}
