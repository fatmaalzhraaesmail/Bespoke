import 'package:bespoke/routers/navigator.dart';
import 'package:bespoke/routers/routers.dart';
import 'package:bespoke/utilities/components/custom_btn.dart';
import 'package:bespoke/utilities/components/fields/text_input_field.dart';
import 'package:bespoke/utilities/theme/media.dart';
import 'package:bespoke/utilities/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaHelper.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,

                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      // color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () => CustomNavigator.push(Routes.login),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Log in',
                                    style: AppTextStyles.unread,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 4, top: 10),
                                  child: Text(
                                    "Create account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 38),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 12, top: 0),
                                  child: Text(
                                    "Sign up and start shopping",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextInputField(
                                  controller: emailcontroller,
                                  label: 'Your Email',
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'Your Email',
                                  onChange: (p0) {},
                                ),
                                TextInputField(
                                  hintText: 'Password',
                                  label: 'Password',
                                  controller: passwordcontroller,
                                  keyboardType: TextInputType.visiblePassword,
                                  onChange: (p0) {},
                                  withBottomPadding: false,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5
                            ),
                            child: CustomBtn(
                              onTap: () => CustomNavigator.push(Routes.home),
                              radius: 18,
                              textColor: Colors.black,
                              height: 50,
                              borderColor: AppTextStyles.maincolor,
                              text: "Sign up",
                              buttonColor: AppTextStyles.maincolor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: CustomBtn(
                              onTap: () => CustomNavigator.push(Routes.home),
                              radius: 18,
                              textColor: Colors.black,
                              height: 50,
                              borderColor: Colors.black,
                              
                              text: "Continue With Facebook",
                              buttonColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 370,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/signupp.jpg',
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    }
}
