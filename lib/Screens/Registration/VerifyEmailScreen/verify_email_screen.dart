// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:sizer/sizer.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  void showNoMailAppsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                AssetPngs.verifyEmail,
                height: 43.h,
              ),
              TextWidget(
                "We have sent an email verification link to your email",
                fontSize: 20.sp,
                color: AppColor.purpleColor,
                fontWeight: FontWeight.w700,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextWidget(
                  "Check your email test@test.com and click the link to verify your email address",
                  fontSize: 11.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              CustomButton(
                buttonText: 'Open Email',
                onBtnPress: () async {
                  var result = await OpenMailApp.openMailApp(
                    nativePickerTitle: 'Select email app to open',
                  );

                  if (!result.didOpen && !result.canOpen) {
                    showNoMailAppsDialog();
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                },
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
