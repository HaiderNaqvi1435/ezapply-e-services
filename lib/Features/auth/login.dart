import 'package:ezapplly/Features/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/buttons.dart';
import '../../Shared/widgets/logo.dart';
import '../../Shared/widgets/richtext.dart';
import '../../Shared/widgets/textinput.dart';
import 'auth_manager.dart';
import 'signup.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
    final formKey = GlobalKey<FormState>();
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: size.width / 1.3,
              child: Consumer<AuthManager>(
                builder: (context, auth, child) => Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      applogo(tagline: "Sign to your account"),
                      const SizedBox(height: 25),
                      Inputtext(
                        labeltext: "Email",
                        controller: auth.uemailcont,
                        validate: (text) {
                          if (text.toString().isEmpty) {
                            return "Email is required";
                          } else if (text == null ||
                              text.isEmpty ||
                              !text.contains('@') ||
                              !text.contains('com') ||
                              !text.contains('.')) {
                            return 'Enter valid Email';
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      Inputtext(
                        labeltext: "Password",
                        controller: auth.passcont,
                        validate: (text) {
                          if (text.isEmpty) {
                            return 'Please enter password';
                            // } else {
                            // if (!regex.hasMatch(text)) {
                            //   return 'Use one uppercase and one sembol and 8 character';
                            // } else {
                            // return null;
                            // }
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: size.width / 1.3,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                  fontSize: 12, color: colorss.primary),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      largeButton(
                        loading: auth.loding,
                        text: "Login",
                        colorss: colorss,
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            auth.userLogin();
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      richtext(
                          onpress: (() {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signuppage(),
                                ));
                          }),
                          text1: "Don't have and account?",
                          text2: 'Register',
                          context: context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
