// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_buddie/Screens/Registration/ConnectAccount/connect_account_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ConnectAccountScreen extends StatefulWidget {
  const ConnectAccountScreen({super.key});

  @override
  State<ConnectAccountScreen> createState() => _ConnectAccountScreenState();
}

class _ConnectAccountScreenState extends State<ConnectAccountScreen> {
  ConnectAccountController connectAccountController =
      Get.put(ConnectAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    commonBoxshdow(blurRadius: 4),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                                color: AppColor.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                shadows: [commonBoxshdow(blurRadius: 5)]),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColor.blackColor,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                "Connect your accounts",
                                fontSize: 16.sp,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                "Connect to all of your bank, kiwisaver and investment accounts to bring everything into one place. ",
                                fontSize: 9.sp,
                                textAlign: TextAlign.left,
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CupertinoSearchTextField(
                      padding: EdgeInsets.all(12),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor.textSecondaryColor,
                      ),

                      // controller: controller,
                      placeholder: "Search all providers",
                      style: TextStyle(),
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                      autocorrect: true,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Add a bank connection",
                      fontSize: 17.sp,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                shadows: [
                                  commonBoxshdow(blurRadius: 30),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Row(children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey.shade100,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            connectAccountController
                                                .bankImages[index].last),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  TextWidget(
                                      connectAccountController
                                          .bankImages[index].first,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                      fontSize: 14.sp),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.blackColor,
                                      ))
                                ]),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Add a Kiwisaver connection",
                      fontSize: 17.sp,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                shadows: [
                                  commonBoxshdow(blurRadius: 30),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Row(children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey.shade100,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            connectAccountController
                                                .bankImages[index].last),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  TextWidget(
                                      connectAccountController
                                          .bankImages[index].first,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                      fontSize: 14.sp),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.blackColor,
                                      ))
                                ]),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Add an investment connection",
                      fontSize: 17.sp,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                shadows: [
                                  commonBoxshdow(blurRadius: 30),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Row(children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey.shade100,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            connectAccountController
                                                .bankImages[index].last),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  TextWidget(
                                      connectAccountController
                                          .bankImages[index].first,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.blackColor,
                                      fontSize: 14.sp),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.blackColor,
                                      ))
                                ]),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: ShapeDecoration(
                    color: Color(0xFFD8E8ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: AppColor.greyColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        AssetPngs.akahuLogo,
                                      ))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextWidget(
                              "Who is Akahu?",
                              color: Color(0xFF001B49),
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          "Akahu is New Zealands open finance platform.\n\n",
                          textAlign: TextAlign.start,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        TextWidget(
                          "Akahu makes it simple to securely access the data that your bank holds about you and to provide that data with platforms like Finclear.\n",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        TextWidget(
                          "Akahu is New Zealands open finance platform.\n",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        TextWidget(
                          "Akahu is New Zealands open finance platform.",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        TextWidget(
                          "How does the connection work?",
                          color: Color(0xFF001B49),
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.left,
                          fontSize: 18.sp,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          "The secure connection with Akahu will pull through your bank balances, transactional information and account details. \n\n",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        TextWidget(
                          "You’ll be redirected to Akahus website to establish the connection.\n",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                        TextWidget(
                          "To manage the connection use this link: my.akahu.io\n\n",
                          textAlign: TextAlign.left,
                          fontSize: 11.sp,
                          color: AppColor.textSecondaryColor,
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
