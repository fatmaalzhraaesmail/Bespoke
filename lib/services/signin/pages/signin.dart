import 'package:bespoke/routers/navigator.dart';
import 'package:bespoke/routers/routers.dart';
import 'package:bespoke/utilities/components/custom_btn.dart';
import 'package:bespoke/utilities/components/fields/text_input_field.dart';
import 'package:bespoke/utilities/theme/media.dart';
import 'package:bespoke/utilities/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                            onTap: () => CustomNavigator.push(Routes.register),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Sign up',
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
                                    "Welcome back!",
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
                                    "Log back into your account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextInputField(
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'Your Email',
                                                                    label: 'Your Email',

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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: HexColor('#FFFFFF'),
                                      focusColor: AppTextStyles.maincolor,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: HexColor('FFFFFF'),
                                      hoverColor: HexColor('24bbb4'),
                                      overlayColor: MaterialStatePropertyAll(
                                          HexColor('FED07A')),
                                      fillColor: MaterialStatePropertyAll(
                                        rememberMe == false
                                            ? Colors.white
                                            : HexColor('#FED07A'),
                                      ),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: HexColor('FED07A'),
                                          width: 1.3),
                                      value: rememberMe,
                                      splashRadius: 5,
                                      tristate: false,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = !rememberMe;
                                        });
                                        print(value);
                                      },
                                    ),
                                    Text(
                                      'Remember',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: Text(
                                    'Forget?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: CustomBtn(
                              onTap: () => CustomNavigator.push(Routes.home),
                              radius: 18,
                              textColor: Colors.black,
                              height: 50,
                              text: "Log in",
                              buttonColor: AppTextStyles.maincolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/istockphoto-958552122-612x612.jpg',
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

    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       width: double.infinity,
    //       height: double.infinity,
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Align(
    //                 alignment: Alignment.topRight,
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: Text(
    //                     'Sign up',
    //                     style: AppTextStyles.unread,
    //                   ),
    //                 )),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 15, horizontal: 20),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(bottom: 4, top: 10),
    //                     child: Text(
    //                       "Welcome back!",
    //                       style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w900,
    //                           fontSize: 38),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(bottom: 12, top: 0),
    //                     child: Text(
    //                       "Log back into your account",
    //                       style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 18),
    //                     ),
    //                   ),
    //                   TextInputField(
    //                     controller: emailcontroller,
    //                     keyboardType: TextInputType.emailAddress,
    //                     hintText: 'Email Address',
    //                     onChange: (p0) {},
    //                   ),
    //                   TextInputField(
    //                     hintText: 'Password',
    //                     controller: passwordcontroller,
    //                     keyboardType: TextInputType.visiblePassword,
    //                     onChange: (p0) {},
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 20,
    //               ),
    //               child: CustomBtn(
    //                 radius: 18,
    //                 textColor: Colors.white,
    //                 height: 48,
    //                 text: "Get Login",
    //                 buttonColor: AppTextStyles.maincolor,
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 20),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     "Forget Password?",
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w600),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Spacer(),
    //             Align(
    //               child: Image.asset('assets/images/istockphoto-958552122-612x612.jpg'))
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
