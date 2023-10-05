import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ConnectYourAccountScreen/connect_your_account_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/constant.dart';

class ConnectYourAccountScreen extends StatefulWidget {
  const ConnectYourAccountScreen({super.key});

  @override
  State<ConnectYourAccountScreen> createState() =>
      _ConnectYourAccountScreenState();
}

class _ConnectYourAccountScreenState extends State<ConnectYourAccountScreen> {
  ConnectYourAccountController connectYourAccountController =
      Get.put(ConnectYourAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.theme.textTheme.titleMedium!.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Navigator.pop(context);
              },
              child: const CommonNotificationIcon()),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Connect your accounts",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Add a bank connection",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [commonBoxshdow(blurRadius: 30)],
                  color: context.theme.primaryColor,
                ),
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.theme.canvasColor,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(connectYourAccountController
                                .bankImages[index].last),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextWidget(
                "Add a Kiwisaver connection",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [commonBoxshdow(blurRadius: 30)],
                  color: context.theme.primaryColor,
                ),
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.theme.canvasColor,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(connectYourAccountController
                                .bankImages[index].last),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextWidget(
                "Add an investment connection",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [commonBoxshdow(blurRadius: 30)],
                  color: context.theme.primaryColor,
                ),
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.theme.canvasColor,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(connectYourAccountController
                                .bankImages[index].last),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: ShapeDecoration(
                  color: const Color(0xFFD8E8ED),
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
                            decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    AssetPngs.akahuLogo,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            "Who is Akahu?",
                            color: const Color(0xFF001B49),
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        "Akahu is New Zealands open finance platform.\n\n",
                        textAlign: TextAlign.left,
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
                        color: const Color(0xFF001B49),
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                        fontSize: 18.sp,
                      ),
                      const SizedBox(
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
              SizedBox(
                height: 3.h,
              ),
              TextWidget(
                "Live connections",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          commonBoxshdow(blurRadius: 30),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 43,
                              width: 43,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey.shade100,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      connectYourAccountController
                                          .bankImages[index].last),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      connectYourAccountController
                                          .bankImages[index].first,
                                      textAlign: TextAlign.start,
                                      maxLine: 1,
                                      fontWeight: FontWeight.w600,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontSize: 13.sp),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextWidget("Updated: 10/10/2022 1pm",
                                      textAlign: TextAlign.start,
                                      maxLine: 1,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.greyColor,
                                      fontSize: 10.sp),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextWidget("Connected",
                                fontWeight: FontWeight.w600,
                                color: AppColor.greenAssentColor,
                                fontSize: 12.sp),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomButton(
                height: 50,
                width: 70,
                isShadow: false,
                widget:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Center(
                      child: TextWidget(
                    "Re-sync connections",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.whiteColor,
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cached,
                        color: AppColor.whiteColor,
                      ))
                ]),
                buttonText: "",
                onBtnPress: () {},
                backgroundColor: SaprateLightDarkColor.greenLightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
