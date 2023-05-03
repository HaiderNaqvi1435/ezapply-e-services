import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/buttons.dart';
import '../../Shared/widgets/logo.dart';
import '../../Shared/widgets/richtext.dart';
import '../../Shared/widgets/textinput.dart';
import 'auth_manager.dart';
import 'login.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});
  bool ischlecked = false;
  final formKey = GlobalKey<FormState>();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      applogo(tagline: "Create your account"),
                      const SizedBox(height: 15),
                      Inputtext(
                        labeltext: "Name",
                        controller: auth.unamecont,
                        validate: (text) {
                          if (text.toString().isEmpty) {
                            return "Name is required";
                          }
                        },
                      ),
                      const SizedBox(height: 12),
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
                          } else {
                            if (!regex.hasMatch(text)) {
                              return 'should contain one upper/lower case one Special character one digit 8 characters';
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Checkbox(
                                value: auth.checked,
                                onChanged: (value) {
                                  auth.setchecked(value!);
                                  print(value);
                                }),
                            const Text('I agree the term and conditions'),
                          ],
                        ),
                      ),
                      largeButton(
                          loading: auth.loding,
                          colorss: colorss,
                          text: "Sign up",
                          // onpress: auth.userSignup,
                          onpress: () {
                            if (formKey.currentState!.validate()) {
                              if (auth.checked) {
                                auth.userSignup();
                              }
                              print(auth.checked);
                            }
                            ;
                          }),
                      const SizedBox(height: 12),
                      richtext(
                          onpress: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  Loginpage(),
                                ));
                          }),
                          text1: "Already have and account?",
                          text2: 'Login',
                          context: context),
                      SizedBox(
                        height: 40,
                      ),
                      richtext1(
                          text1: 'Term & Conditions  ',
                          text2: 'and',
                          text3: '  Privacy Policy',
                          context: context),
                      SizedBox(
                        height: 20,
                      )
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
