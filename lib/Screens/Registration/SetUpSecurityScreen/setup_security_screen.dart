// import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/components/pin_code_widget.dart';
// import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
// import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
// import 'package:budget_buddie/Utils/constant.dart';
// import 'package:budget_buddie/generated.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// class SetupSecurityScreen extends StatefulWidget {
//   const SetupSecurityScreen({super.key});
//
//   @override
//   State<SetupSecurityScreen> createState() => _SetupSecurityScreenState();
// }
//
// class _SetupSecurityScreenState extends State<SetupSecurityScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.theme.primaryColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       AssetIcons.appIcon,
//                       height: 40,
//                       width: 40,
//                     ),
//                     TextWidget(
//                       'BudgetBuddie',
//                       color: context.theme.textTheme.titleMedium!.color,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   children: [
//                     TextWidget(
//                       "Set up your 4-digit Security PIN",
//                       fontSize: 10.sp,
//                       color: context.theme.hintColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Container(
//                       // height: 400,
//                       color: Colors.transparent,
//                       child: CustomPinCodeWidget(
//                         minPinLength: 4,
//                         maxPinLength: 4,
//                         buttonColor: context.theme.primaryColor,
//                         enterButtonLabel: AssetIcons.appIcon,
//                         filledIndicatorColor: AppColor.textSecondaryColor,
//                         numbersStyle: TextStyle(
//                           color: AppColor.textSecondaryColor,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         borderSide: const BorderSide(
//                             color: AppColor.textSecondaryColor),
//                         onChangedPin: (pin) {},
//                         onEnter: (pin, _) {
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     CustomButton(
//                         buttonText: "Set PIN",
//                         onBtnPress: () {
//                           Get.back();
//                         },
//                         height: 50,
//                         width: 14.w,
//                         textColor: context.theme.primaryColor,
//                         ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
