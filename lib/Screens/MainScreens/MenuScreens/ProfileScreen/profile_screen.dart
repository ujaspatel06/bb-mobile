// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/ChangePasswordScreen/change_password_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/profile_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/custom_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    profileController.isFaceID.value =
        box.read(GetStorageKey.isFaceId) ?? false;
    profileController.isPinLogin.value =
        box.read(GetStorageKey.isPinLogin) ?? false;
    super.initState();
  }

  Country? country;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: customAppBar(
          isProfilescreen: true,
          actions: [
            InkWell(
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Routes.notificationScreen),
                    screen: const NotificationScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: const CommonNotificationIcon()),
            const SizedBox(
              width: 14,
            ),
          ],
          titleWidget: TextWidget(
            "Settings",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: profileController.profileFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: pickImage,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                margin: EdgeInsets.all(6),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [commonBoxshdow(blurRadius: 30)],
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: profileController.imagePath.isEmpty
                                        ? NetworkImage(
                                                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png")
                                            as ImageProvider
                                        : FileImage(
                                            File(profileController
                                                .imagePath.value),
                                          ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: SaprateLightDarkColor.greenLightColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5,
                                      color: context
                                          .theme.scaffoldBackgroundColor),
                                ),
                                child: Icon(
                                  Icons.photo_camera_outlined,
                                  size: 17,
                                  color: context.theme.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    "Your details",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        "Name",
                        fontSize: 12.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      customCardTextField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return ErrorMsg.ENTER_NAME;
                            }
                            return null;
                          },
                          controller: profileController.nameController,
                          boxShadow: [commonBoxshdow(blurRadius: 30)],
                          decorationColor: context.theme.primaryColor,
                          cursorColor:
                              context.theme.textTheme.titleMedium!.color!,
                          hintColor:
                              context.theme.textTheme.titleMedium!.color!,
                          textColor:
                              context.theme.textTheme.titleMedium!.color!),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                        "Phone number",
                        fontSize: 12.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        // height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [commonBoxshdow(blurRadius: 30)],
                          color: context.theme.primaryColor,
                        ),
                        child: IntlPhoneField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                country?.maxLength),
                          ],
                          onCountryChanged: (c) {
                            setState(() {
                              country = c;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          pickerDialogStyle: PickerDialogStyle(
                              searchFieldCursorColor:
                                  context.theme.textTheme.titleMedium!.color,
                              searchFieldInputDecoration: InputDecoration(
                                hintText: "Search Country",
                                suffixIcon: Icon(Icons.search),
                                suffixIconColor:
                                    context.theme.textTheme.titleMedium!.color,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: context.theme.textTheme
                                            .titleMedium!.color!,
                                        width: 2)),
                              )),
                          validator: (v) {
                            country = PhoneNumber.getCountry(v!.countryCode);

                            if (v.number.length != country!.maxLength) {
                              return ErrorMsg.ENTER_PHONE_NUMBER;
                            }
                            return null;
                          },
                          controller: profileController.phoneController,
                          textAlignVertical: TextAlignVertical.center,
                          dropdownTextStyle: TextStyle(
                              fontSize: 13.sp,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                          dropdownIcon: Icon(
                            Icons.arrow_drop_down,
                            color: context.theme.textTheme.titleMedium!.color,
                          ),
                          cursorColor:
                              context.theme.textTheme.titleMedium!.color,
                          disableLengthCheck: true,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                          keyboardType: TextInputType.number,
                          initialCountryCode: 'IN',
                          onChanged: (phone) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                        "Your email",
                        fontSize: 12.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      customCardTextField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return ErrorMsg.ENTER_EMAIL;
                            }
                            return null;
                          },
                          controller: profileController.emailController,
                          boxShadow: [commonBoxshdow(blurRadius: 30)],
                          textInputType: TextInputType.emailAddress,
                          decorationColor: context.theme.primaryColor,
                          cursorColor:
                              context.theme.textTheme.titleMedium!.color!,
                          hintColor:
                              context.theme.textTheme.titleMedium!.color!,
                          textColor:
                              context.theme.textTheme.titleMedium!.color!),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextWidget(
                    "Notification preferences",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          "Receive emails?",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            decoration:
                                BoxDecoration(boxShadow: [commonBoxshdow()]),
                            width: 50.w,
                            child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: context.theme.primaryColor,
                                  constraints: const BoxConstraints(
                                      maxHeight: 40, minHeight: 40),
                                  contentPadding: const EdgeInsets.all(10),
                                  isDense: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Obx(
                                    () => DropdownButton<String>(
                                      elevation: 0,
                                      value:
                                          profileController.selectedType.value,
                                      isDense: false,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: context.theme.textTheme
                                            .titleMedium!.color!,
                                      ),
                                      onChanged: (String? newValue) {
                                        profileController.selectedType.value =
                                            newValue!;
                                      },
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      items: profileController.profileType
                                          .map((map) {
                                        return DropdownMenuItem<String>(
                                          value: map,
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(map, maxLines: 1),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              );
                            }))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextWidget(
                    "Preferred push notification",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Budget",
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController.isBudget.value =
                                                  value;
                                            },
                                            value: profileController
                                                .isBudget.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Goals",
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController.isGoal.value =
                                                  value;
                                            },
                                            value:
                                                profileController.isGoal.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextWidget(
                                        "Monthly digest",
                                        textAlign: TextAlign.start,
                                        maxLine: 1,
                                        fontSize: 13.sp,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController
                                                  .isMonthly.value = value;
                                            },
                                            value: profileController
                                                .isMonthly.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Merchants",
                                      fontSize: 13.sp,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController
                                                  .isMerchants.value = value;
                                            },
                                            value: profileController
                                                .isMerchants.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextWidget(
                    "Security",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Face login",
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Spacer(),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController.isFaceID.value =
                                                  value;
                                              box.write(GetStorageKey.isFaceId,
                                                  value);
                                            },
                                            value: profileController
                                                .isFaceID.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  boxShadow: [commonBoxshdow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "PIN login",
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: CupertinoSwitch(
                                            onChanged: (bool value) {
                                              profileController
                                                  .isPinLogin.value = value;
                                              box.write(
                                                  GetStorageKey.isPinLogin,
                                                  value);
                                            },
                                            value: profileController
                                                .isPinLogin.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: Routes.changePasswordScreen),
                            screen: const ChangePasswordScreen(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: context.theme.primaryColor,
                              boxShadow: [commonBoxshdow(blurRadius: 30)]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 4, top: 4),
                            child: Row(children: [
                              TextWidget(
                                "Change password",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: context
                                        .theme.textTheme.titleMedium!.color,
                                  ))
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextWidget(
                        "Appearance",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            boxShadow: [commonBoxshdow()],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              TextWidget(
                                "Dark Mode",
                                // maxLine: 1,
                                fontSize: 13.sp,
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                                // textOverflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: CupertinoSwitch(
                                    onChanged: (bool value) {
                                      if (profileController
                                          .isDarkSwitch.value) {
                                        profileController.onChangeTheme(false);
                                      } else {
                                        profileController.onChangeTheme(true);
                                      }
                                    },
                                    value: profileController.isDarkSwitch.value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextWidget(
                        "Payments & Billing",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          TextWidget(
                            "Next payment date",
                            fontSize: 12.sp,
                            color: context.theme.textTheme.titleMedium!.color,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          customCardTextField(
                              boxShadow: [commonBoxshdow(blurRadius: 30)],
                              decorationColor: context.theme.primaryColor,
                              cursorColor:
                                  context.theme.textTheme.titleMedium!.color!,
                              hintColor:
                                  context.theme.textTheme.titleMedium!.color!,
                              textColor:
                                  context.theme.textTheme.titleMedium!.color!),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          TextWidget(
                            "Next payment amount",
                            fontSize: 12.sp,
                            color: context.theme.textTheme.titleMedium!.color,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          customCardTextField(
                              boxShadow: [commonBoxshdow(blurRadius: 30)],
                              decorationColor: context.theme.primaryColor,
                              cursorColor:
                                  context.theme.textTheme.titleMedium!.color!,
                              hintColor:
                                  context.theme.textTheme.titleMedium!.color!,
                              textColor:
                                  context.theme.textTheme.titleMedium!.color!),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      TextWidget(
                        "Current payment method",
                        fontSize: 12.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 13, bottom: 13, left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: context.theme.primaryColor,
                            boxShadow: [commonBoxshdow(blurRadius: 30)]),
                        child: Row(
                          children: [
                            Image.asset(AssetIcons.visaIcon),
                            SizedBox(
                              width: 6.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        "Visa ending 1234",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context.theme.hintColor,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.credit_card_rounded,
                                            color: AppColor.greenAssentColor,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Edit",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.greenAssentColor,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      TextWidget(
                                        "Remove",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red,
                                        // textAlign: TextAlign.end,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    buttonText: "Log out",
                    width: 30,
                    height: 50,
                    fontSize: 14.sp,
                    borderRadius: 14,
                    backgroundColor: context.theme.primaryColor,
                    borderColor: context.theme.cardColor,
                    textColor: context.theme.cardColor,
                    onBtnPress: () {
                      box.remove(GetStorageKey.account);
                      box.remove(GetStorageKey.USER_INFO);
                      box.remove(GetStorageKey.loginPin);
                      box.remove(GetStorageKey.isFaceId);
                      box.remove(GetStorageKey.isPinLogin);
                      box.remove(GetStorageKey.isBiometricValid);
                      box.remove(GetStorageKey.asset);
                      box.remove(GetStorageKey.editsWidgets);
                      Get.offAllNamed(Routes.passwordLoginScreen);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        profileController.imagePath.value = pickedImage.path;
        profileController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
