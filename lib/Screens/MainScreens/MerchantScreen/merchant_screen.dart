// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/AddMerchantScreen/add_merchant_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/merchant_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_avatar_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import 'Components/filter_bottom_sheet.dart';
import 'MerchnatDetails/merchant_details_screen.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({super.key});

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen>
    with TickerProviderStateMixin {
  MerchantController merchantController = Get.put(MerchantController());

  AnimationController? controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);

    controller!.duration = const Duration(seconds: 1);

    controller!.reverseDuration = const Duration(seconds: 1);
    controller!.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: customAppBar(
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: Routes.addMerchantScreen),
                  screen: const AddMerchantScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: SvgPicture.asset(
                AssetSvgs.addIcon,
                color: context.theme.textTheme.titleMedium!.color,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
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
                  // mainController.pageIndex.value = NestedKeys.menuId;
                  // Get.toNamed(Routes.notificationScreen);
                },
                child: const CommonNotificationIcon()),
            const SizedBox(
              width: 14,
            ),
          ],
          titleWidget: TextWidget(
            "Your merchants",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 7),
                decoration: ShapeDecoration(
                  color: box.read(GetStorageKey.themeMode) ?? false
                      ? SaprateLightDarkColor.cyanColor
                      : SaprateLightDarkColor.greenLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [commonBoxshdow(blurRadius: 30)],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.shade100,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AssetPngs.categoryMerchant,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    TextWidget("Categorised Merchants",
                        fontWeight: FontWeight.w600,
                        color: context.theme.primaryColor,
                        fontSize: 13.sp),
                    const Spacer(),
                    TextWidget("57",
                        fontWeight: FontWeight.w600,
                        color: context.theme.primaryColor,
                        fontSize: 12.sp),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 7),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: box.read(GetStorageKey.themeMode) ?? false
                      ? SaprateLightDarkColor.redColor
                      : SaprateLightDarkColor.pinkLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [commonBoxshdow(blurRadius: 30)],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.shade100,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AssetPngs.uncategoryMerchant,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    TextWidget("Uncategorised Merchants",
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor,
                        fontSize: 13.sp),
                    const Spacer(),
                    TextWidget("5",
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor,
                        fontSize: 12.sp),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextWidget("Search",
                  fontWeight: FontWeight.w700,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontSize: 15.sp),
              const SizedBox(
                height: 15,
              ),
              customCardTextField(
                onChanged: (val) async {
                  await merchantController.searchdata(val!);
                },
                controller: merchantController.txtSearchMerchant,
                boxShadow: [commonBoxshdow()],
                decorationColor: context.theme.primaryColor,
                cursorColor: context.theme.textTheme.titleMedium!.color!,
                hintColor: context.theme.textTheme.titleMedium!.color!,
                textColor: context.theme.textTheme.titleMedium!.color!,
                borderRadius: 10,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    AssetSvgs.searchIcon,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextWidget("Merchants",
                      fontWeight: FontWeight.w700,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 15.sp),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      MerchantFilterBottomSheet.showModalSheet(
                          context, controller!);
                    },
                    child: SvgPicture.asset(
                      AssetSvgs.notificationFilter,
                      color: context.theme.textTheme.titleMedium!.color,
                      height: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: merchantController.merchantList.length,
                    itemBuilder: (context, index) {
                      for (int i = 0; i < 20; i++) {
                        merchantController.selectedmerchantDropdown.add("All");
                      }
                      return InkWell(
                        onTap: () {
                          PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: Routes.merchnatDetailScreen),
                            screen: MerchantDetailsScreen(
                                merchantDetailName: merchantController
                                    .merchantList[index].first),
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          padding: const EdgeInsets.all(13),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueGrey.shade100,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      merchantController.merchantsImages[index],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        merchantController
                                            .merchantList[index].first,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.start,
                                        maxLine: 1,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                        fontSize: 10.5.sp),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        TextWidget("\$560.80 ",
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.start,
                                            maxLine: 1,
                                            color: AppColor.greenAssentColor,
                                            fontSize: 9.sp),
                                        Expanded(
                                          child: TextWidget("| 5 Transactions",
                                              textAlign: TextAlign.start,
                                              maxLine: 1,
                                              fontWeight: FontWeight.w400,
                                              color: context.theme.textTheme
                                                  .titleMedium!.color,
                                              fontSize: 9.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: InkWell(
                                  onTap: () {
                                    commonModalSheet(
                                      context,
                                      title: "Merchant categories",
                                      heigth: 2.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            "Category",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context.theme.textTheme
                                                .titleMedium!.color,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Obx(
                                            () => Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        merchantController
                                                            .merchantCategoryList
                                                            .length;
                                                    i++)
                                                  GestureDetector(
                                                    onTap: () {
                                                      merchantController
                                                          .merchantList[index]
                                                          .last = merchantController
                                                              .merchantCategoryList[
                                                          i];
                                                      Get.back();
                                                    },
                                                    child: Chip(
                                                      avatar: Container(
                                                          alignment: Alignment
                                                              .center,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .pinkLightColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child:
                                                              const TextWidget(
                                                            "👌🏻",
                                                            fontSize: 11,
                                                          )),
                                                      label: TextWidget(
                                                          merchantController
                                                                  .merchantCategoryList[
                                                              i],
                                                          fontSize: 10.sp,
                                                          color: context
                                                              .theme
                                                              .textTheme
                                                              .titleMedium!
                                                              .color),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      side: const BorderSide(
                                                          color: AppColor
                                                              .greyColor),
                                                    ).marginOnly(right: 10),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Obx(
                                    () => FittedBox(
                                      alignment: Alignment.centerRight,
                                      child: CommonAvatarChip(
                                        title: merchantController
                                            .merchantList[index].last,
                                        avatar: '👌🏻',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 3,
                              //   child: FormField<String>(
                              //     builder: (FormFieldState<String> state) {
                              //       return InputDecorator(
                              //         decoration: InputDecoration(
                              //           filled: true,
                              //           fillColor: context
                              //               .theme.textTheme.labelLarge!.color,
                              //           constraints: const BoxConstraints(
                              //               maxHeight: 40, minHeight: 40),
                              //           contentPadding: const EdgeInsets.all(8),
                              //           isDense: false,
                              //           border: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(12),
                              //               borderSide: BorderSide.none),
                              //           disabledBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(12),
                              //               borderSide: BorderSide.none),
                              //           focusedBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(12),
                              //               borderSide: BorderSide.none),
                              //           enabledBorder: OutlineInputBorder(
                              //               borderRadius:
                              //                   BorderRadius.circular(12),
                              //               borderSide: BorderSide.none),
                              //         ),
                              //         child: DropdownButtonHideUnderline(
                              //           child: Obx(
                              //             () => DropdownButton<String>(
                              //               elevation: 0,
                              //               value: merchantController
                              //                   .selectedmerchantDropdown[index]
                              //                   .toString(),
                              //               isDense: false,
                              //               icon: Icon(
                              //                 Icons.keyboard_arrow_down,
                              //                 color: context.theme.textTheme
                              //                     .titleMedium!.color!,
                              //               ),
                              //               onChanged: (String? newValue) {
                              //                 for (var data
                              //                     in merchantController
                              //                         .merchantList) {
                              //                   if (data ==
                              //                       merchantController
                              //                           .merchantList[index]) {
                              //                     merchantController
                              //                             .selectedmerchantDropdown[
                              //                         index] = newValue!;
                              //                     print("---<><> $data");
                              //                   }
                              //                 }
                              //               },
                              //               isExpanded: true,
                              //               style: TextStyle(
                              //                 fontSize: 11.sp,
                              //                 fontWeight: FontWeight.w500,
                              //                 color: context.theme.textTheme
                              //                     .titleMedium!.color,
                              //               ),
                              //               borderRadius:
                              //                   BorderRadius.circular(10),
                              //               items: merchantController
                              //                   .merchantDropdownType
                              //                   .map((map) {
                              //                 return DropdownMenuItem<String>(
                              //                   value: map,
                              //                   alignment:
                              //                       AlignmentDirectional.center,
                              //                   child: Text(map, maxLines: 1),
                              //                 );
                              //               }).toList(),
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              //
                              //   // TextFormField(
                              //   //   cursorColor: context
                              //   //       .theme.textTheme.titleLarge!.color,
                              //
                              //   //   style: TextStyle(
                              //   //     fontSize: 12.sp,
                              //   //     color: context.theme.textTheme
                              //   //             .titleMedium!.color ??
                              //   //         AppColor.blackColor,
                              //   //   ),
                              //   //   decoration: InputDecoration(
                              //   //       // hintText: hintText ?? label,
                              //   //       filled: true,
                              //   //       isDense: false,
                              //   //       fillColor: context.theme.textTheme
                              //   //               .labelLarge!.color ??
                              //   //           AppColor.whiteColor,
                              //   //       hintStyle: const TextStyle(
                              //   //           color:
                              //   //               AppColor.textSecondaryColor,
                              //   //           fontSize: 14),
                              //   //       contentPadding: const EdgeInsets.symmetric(
                              //   //           horizontal: 12),
                              //   //       constraints: const BoxConstraints(
                              //   //           maxHeight: 45, minHeight: 45),
                              //   //       border: OutlineInputBorder(
                              //   //           borderRadius:
                              //   //               BorderRadius.circular(12),
                              //   //           borderSide: BorderSide.none),
                              //   //       focusedBorder: OutlineInputBorder(
                              //   //           borderRadius:
                              //   //               BorderRadius.circular(12),
                              //   //           borderSide: BorderSide.none),
                              //   //       enabledBorder: OutlineInputBorder(
                              //   //           borderRadius:
                              //   //               BorderRadius.circular(12),
                              //   //           borderSide: BorderSide.none),
                              //   //       disabledBorder: OutlineInputBorder(
                              //   //           borderRadius:
                              //   //               BorderRadius.circular(12),
                              //   //           borderSide: BorderSide.none),
                              //   //       errorBorder: OutlineInputBorder(
                              //   //           borderRadius:
                              //   //               BorderRadius.circular(12),
                              //   //           borderSide: BorderSide.none)),
                              //   // ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
