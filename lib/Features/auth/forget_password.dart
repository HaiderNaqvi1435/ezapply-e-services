import 'package:ezapplly/Features/auth/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:keep_tasks/Core/Classes/Themes/Utils.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
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
              const Text(
                "Enter your Email",
                // style: Utils.normalText(size: 16),
              ),
              const SizedBox(height: 20),
              Consumer<AuthManager>(
                builder: (context, value, child) => TextFormField(
                  controller: value.uemailcont,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid email";
                    } else
                      null;
                  },
                  // decoration: Utils.myTextField(label: "Email"),
                  decoration: const InputDecoration(label: Text('Email')),
                ),
              ),
              const SizedBox(height: 5),
              Consumer<AuthManager>(
                builder: (context, value, child) => ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   minimumSize: Size.fromHeight(50),
                    // ),
                    onPressed: value.resetpasswordemail(),
                    child: const Text(
                      "Reset Password",
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
