
import 'package:flutter/material.dart';
import 'package:luna/views/screens/auth/forgot_password/create_new_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_font_styles.dart';
import '../../../../utils/constants/app_images.dart';
import '../login_screen/login_screen.dart';

class InputPhoneForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/input_phone_forgot_password_screen";
  const InputPhoneForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneForgotPasswordScreen> createState() => _InputPhoneForgotPasswordScreenState();
}

class _InputPhoneForgotPasswordScreenState extends State<InputPhoneForgotPasswordScreen> {
  var focusNode = FocusNode();
  final TextEditingController _txtOTPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onTap: (){
          focusNode.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Forgot Password",style: AppFontStyle().titleM(color: AppColors().primary)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.width/4,
                    child: Image.asset(AppImages.logo),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width/10,
              ),
              // _buildPhoneInputPage(context)

               _buildOTPInputPage(context)

            ],
          ),
        ),
      ),
    );
  }

  _buildPhoneInputPage(BuildContext context){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 25.px, bottom: 1.px),
          child: Text(
            'Enter your phone number to register',
            style: AppFontStyle().textM(),

          ),
        ),
        SizedBox(
          height: 15.px,
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.px, vertical: 10.px),
          padding:
          EdgeInsets.symmetric(horizontal: 15.px, vertical: 12.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              border: Border.all(
                  width: 1, color: Colors.grey.withOpacity(0.4))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.phone_rounded,color: AppColors().grey,),
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width / 1.50.px,

                child: TextField(
                  keyboardType:TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Phone',
                    hintStyle: AppFontStyle().textM(color: AppColors().grey),
                  ),
                  // obscureText: isHidePassword,
                ),
              ),
              SizedBox(width: 20.px,)
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.px, vertical: 10.px),
                  height: 50.px,
                  width: MediaQuery.of(context).size.width/2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors().primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Send Code', style: AppFontStyle().titleS(color: AppColors().white))),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/2.5.px,),
        GestureDetector(
            onTap: () {
              // Get.to(RegisterPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have account?",style: AppFontStyle().textM(),),
                SizedBox(width: 5.px,),
                GestureDetector(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.routeName, (route) => false);
                    },
                    child: Text("Login",style: AppFontStyle().titleS(color: AppColors().primary,fontSize: 17),)),
              ],
            )
        ),
        SizedBox(height: 10.px),
      ],
    );
  }
  _buildOTPInputPage(BuildContext context){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 25.px, bottom: 1.px),
          child: Text(
            'Enter OTP code',
            style: AppFontStyle().textM(),

          ),
        ),
        SizedBox(
          height: 18.px,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.px),
          child: _buildPinInput(context),
        )
        ,


        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CreateNewPasswordScreen.routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.px, vertical: 10.px),
                  height: 50.px,
                  width: MediaQuery.of(context).size.width/2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors().primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Verify', style: AppFontStyle().titleS(color: AppColors().white))),
            ],
          ),
        ),

        SizedBox(height: 35.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 25.px,),
            Text(
              "Didn't get code?",
              style: AppFontStyle().textM(),

            ),
            SizedBox(width: 5.px,),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                },
                child: Text("Resend",style: AppFontStyle().titleS(color: AppColors().primary,fontSize: 17),)),
          ],
        ),

        SizedBox(height: MediaQuery.of(context).size.height/3.px,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have account?",style: AppFontStyle().textM(),),
            SizedBox(width: 5.px,),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                },
                child: Text("Login",style: AppFontStyle().titleM(color: AppColors().primary),)),
          ],
        ),
        SizedBox(height: 10.px),
      ],
    );

  }

  _buildPinInput(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      animationType: AnimationType.fade,
      autoFocus: true,
      length: 6,
      obscureText: false,
      validator: (v) {
        return null;
      },
      focusNode: focusNode,
      controller: _txtOTPController,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.px),
        fieldHeight: 55.px,
        fieldWidth: 50.px,
        borderWidth: 0.3,
        activeFillColor: Colors.white,
        activeColor: AppColors().blue,
        selectedColor: AppColors().primary,
        disabledColor: Colors.grey,
        // inactiveColor: _valid ? AppColors().border() : Colors.red,
        inactiveColor: AppColors().grey,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      onChanged: (value) {
        // setState(() {
        // _otpCode = value;
        // // });
        // print("djfkdsfhjdshfkjhdjfhkd$_otpCode");
      },
      beforeTextPaste: (text) {
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
