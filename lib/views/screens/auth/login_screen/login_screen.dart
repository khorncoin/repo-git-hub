import 'package:flutter/material.dart';
import 'package:luna/utils/constants/app_font_styles.dart';
import 'package:luna/views/screens/auth/register_screen/input_phone_register_screen.dart';
import 'package:luna/views/widgets/app_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../forgot_password/input_phone_forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 3,
              child: Center(
                child: Image.asset(AppImages.logo),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 25.px, bottom: 1.px),
              child: Text(
                'Enter your email or phone to Login',
                style: AppFontStyle()
                    .titleS(color: AppColors().primary.withOpacity(0.7)),
              ),
            ),
            SizedBox(
              height: 15.px,
            ),
            Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 25.px, vertical: 10.px),
                child: AppTextField.appTextField(context,
                    hintText: "Email / Phone",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors().grey,
                    ))),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10.px),
                child: AppTextField.appTextField(context,
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors().grey,
                    ),
                    isObsecure: true,
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: AppColors().grey))),
            Container(
              margin: EdgeInsets.only(right: 25.px, top: 10.px, bottom: 15.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, InputPhoneForgotPasswordScreen.routeName);
                    },
                    child: Text("Forgot Password?", style: AppFontStyle().titleS()),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 55.px, vertical: 10.px),
                  height: 50.px,
                  width: MediaQuery.of(context).size.width / 2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors().primary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          color: AppColors().grey.withOpacity(0.1),
                          spreadRadius: 1,
                          offset: const Offset(1, 1))
                    ],
                  ),
                  child: Text('Login',
                      style: AppFontStyle().titleS(color: AppColors().white))),
            ),
            SizedBox(
              height: 15.px,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: AppColors().grey.withOpacity(0.4),
                    ),
                    SizedBox(
                      width: 15.px,
                    ),
                    Text("OR", style: AppFontStyle().textM(color: AppColors().grey)),
                    SizedBox(
                      width: 15.px,
                    ),
                    Container(
                      width: 100,
                      height: 1,
                      color: AppColors().grey.withOpacity(0.4),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.px,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo_google,
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 30.px,
                ),
                Image.asset(
                  AppImages.logo_facebook,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9.px,
            ),
            GestureDetector(
                onTap: () {
                  // Get.to(RegisterPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: AppFontStyle().textM(),
                    ),
                    SizedBox(
                      width: 5.px,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, InputPhoneRegisterScreen.routeName);
                        },
                        child: Text(
                          "Register",
                          style: AppFontStyle()
                              .titleS(color: AppColors().primary, fontSize: 17),
                        )),
                  ],
                )),
            SizedBox(height: 30.px),
          ],
        ),
      ),
    );
  }
}
