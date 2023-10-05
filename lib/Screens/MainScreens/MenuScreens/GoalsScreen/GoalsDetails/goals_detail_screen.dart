// import 'dart:io';
//
// import 'package:budget_buddie/Data/Models/goals_model.dart';
// import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/GoalsDetails/goals_detail_controller.dart';
// import 'package:budget_buddie/Utils/Utils.dart';
// import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
// import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
// import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
// import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
// import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
// import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
// import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
// import 'package:budget_buddie/Utils/constant.dart';
// import 'package:budget_buddie/generated.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../../../Utils/Widgets/common_bottom_sheet.dart';
//
// class GoalsDetailScreen extends StatefulWidget {
//   const GoalsDetailScreen({super.key, required this.goalItem});
//   final Goals goalItem;
//
//   @override
//   State<GoalsDetailScreen> createState() => _GoalsDetailScreenState();
// }
//
// class _GoalsDetailScreenState extends State<GoalsDetailScreen> {
//   GoalsDetailController goalsDetailController =
//       Get.put(GoalsDetailController());
//
//   ImagePicker picker = ImagePicker();
//   File? image;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.theme.scaffoldBackgroundColor,
//       appBar: customAppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.close,
//                 color: context.theme.textTheme.titleMedium!.color,
//               ))
//         ],
//         titleWidget: TextWidget(
//           "Goal details",
//           color: context.theme.textTheme.titleMedium!.color,
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [commonBoxshdow(blurRadius: 30)],
//                     color: stringToColor(widget.goalItem.colour ?? '')),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: 43,
//                           width: 43,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blueGrey.shade100,
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 AssetIcons.appIcon,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 4.w,
//                         ),
//                         TextWidget(widget.goalItem.goalName ?? "",
//                             fontWeight: FontWeight.w600,
//                             color: context.theme.primaryColor,
//                             fontSize: 13.sp),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Row(
//                       children: [
//                         TextWidget(
//                           "Balance",
//                           fontSize: 9.sp,
//                           color: context.theme.primaryColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         const Spacer(),
//                         TextWidget(
//                           "50%",
//                           fontSize: 9.sp,
//                           color: context.theme.primaryColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     CommonProgressBar(
//                       maxValue: 100,
//                       size: 6,
//                       borderRadius: BorderRadius.circular(50),
//                       progressColor: goalsDetailController.darken(
//                           stringToColor(widget.goalItem.colour ?? ''), 0.2),
//                       backgroundColor: AppColor.whiteColor.withOpacity(0.4),
//                       currentValue: 45,
//                       direction: Axis.horizontal,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         TextWidget(
//                           "\$300 ",
//                           fontSize: 14.sp,
//                           color: context.theme.primaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         TextWidget(
//                           " of \$699",
//                           fontSize: 10.sp,
//                           color: context.theme.primaryColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         const Spacer(),
//                         TextWidget(
//                           "12th December 2022",
//                           fontSize: 10.sp,
//                           color: context.theme.primaryColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextWidget(
//                       "See detail",
//                       color: context.theme.primaryColor,
//                       fontSize: 10.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextWidget(
//                     "Edit Goal",
//                     fontSize: 16.sp,
//                     color: context.theme.textTheme.titleMedium!.color,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   CustomButton(
//                     height: 30,
//                     width: 20,
//                     isShadow: false,
//                     buttonText: "Update",
//                     onBtnPress: () {
//                       Navigator.pop(context);
//                     },
//                     backgroundColor: AppColor.redColor,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               CommonFormField(
//                 context: context,
//                 label: 'Name',
//                 // controller: grocerieBudgetController.tempController,
//                 flex1: 1,
//                 flex2: 3,
//               ),
//               CommonFormField(
//                 context: context,
//                 label: 'Goal dollar value',
//                 flex1: 2,
//                 flex2: 2,
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: context.theme.primaryColor,
//                     boxShadow: [commonBoxshdow()],
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Column(children: [
//                   CommonFormField(
//                     context: context,
//                     label: 'Contributions',
//                     isCommonContainer: true,
//                     flex1: 3,
//                     flex2: 5,
//                   ),
//                   CommonFormField(
//                     context: context,
//                     label: 'How often?',
//                     isCommonContainer: true,
//                     isDropDown: true,
//                     selectedItem: goalsDetailController.howOftenSelectedVal,
//                     dropDownItems: goalsDetailController.howOftenItems,
//                     // controller: grocerieBudgetController.tempController,
//                     flex1: 1,
//                     flex2: 2,
//                   ),
//                 ]),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               CommonFormField(
//                 context: context,
//                 label: 'Account',
//                 flex1: 1,
//                 flex2: 2,
//                 isDropDown: true,
//                 selectedItem: goalsDetailController.howOftenSelectedVal,
//                 dropDownItems: goalsDetailController.howOftenItems,
//                 suffixIcon: Container(
//                         height: 40,
//                         width: 40,
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             color: context.theme.canvasColor,
//                             borderRadius: BorderRadius.circular(100)),
//                         child: Image.asset(AssetIcons.appIcon))
//                     .marginOnly(left: 12),
//               ),
//               Obx(
//                 () => CommonFormField(
//                   context: context,
//                   label: 'Personalised colour',
//                   onlyStackIcon: Container(
//                     height: 40,
//                     padding: const EdgeInsets.all(5.0),
//                     child: InkWell(
//                       onTap: () {
//                         commonModalSheet(
//                           context,
//                           title: "Pick your colour",
//                           heigth: 2.6,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               TextWidget(
//                                 "Colour",
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color:
//                                     context.theme.textTheme.titleMedium!.color,
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Obx(
//                                 () => Wrap(
//                                   children: [
//                                     for (var i = 0;
//                                         i <
//                                             goalsDetailController
//                                                 .pickColorItemList.length;
//                                         i++)
//                                       GestureDetector(
//                                         onTap: () {
//                                           goalsDetailController
//                                                   .pickSelectedColor.value =
//                                               goalsDetailController
//                                                   .pickColorItemList.keys
//                                                   .elementAt(i);
//                                           goalsDetailController
//                                                   .pickSelectedColorName.value =
//                                               goalsDetailController
//                                                   .pickColorItemList.values
//                                                   .elementAt(i);
//                                         },
//                                         child: Chip(
//                                           // visualDensity: VisualDensity(
//                                           //     vertical: -2, horizontal: -2),
//                                           label: TextWidget(
//                                               goalsDetailController
//                                                   .pickColorItemList.values
//                                                   .elementAt(i),
//                                               fontSize: 11.sp,
//                                               color: AppColor.whiteColor),
//                                           backgroundColor: goalsDetailController
//                                               .pickColorItemList.keys
//                                               .elementAt(i),
//                                         ).marginOnly(right: 10),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: FittedBox(
//                           alignment: Alignment.centerRight,
//                           child: CommonChip(
//                               title: goalsDetailController
//                                   .pickSelectedColorName.value,
//                               bgColor: goalsDetailController
//                                   .pickSelectedColor.value)),
//                     ),
//                   ),
//                   flex1: 4,
//                   flex2: 3,
//                 ),
//               ),
//               CommonFormField(
//                 context: context,
//                 onTap: pickImage,
//                 fileImage: image == null
//                     ? const SizedBox()
//                     : Container(
//                         height: 28,
//                         width: 28,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: FileImage(
//                                 File(image!.path),
//                               ),
//                             )),
//                       ),
//                 label: 'Personalised Emoji',
//                 readOnly: true,
//                 flex1: 2,
//                 flex2: 1,
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               CustomButton(
//                 width: 60,
//                 isShadow: false,
//                 widget:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Center(
//                       child: TextWidget(
//                     "Remove goal",
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w700,
//                     color: AppColor.whiteColor,
//                   )),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const Icon(
//                     Icons.close,
//                     color: AppColor.whiteColor,
//                   )
//                 ]),
//                 buttonText: "",
//                 onBtnPress: () {
//                   Navigator.pop(context);
//                 },
//                 backgroundColor: AppColor.redColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   pickImage() async {
//     final XFile? pickedImage =
//         await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setState(() {
//         image = File(pickedImage.path);
//       });
//     }
//   }
// }
