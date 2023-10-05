// ignore_for_file: constant_identifier_names

import 'package:budget_buddie/Screens/LoginScreens/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_binding.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/main_binding.dart';
import 'package:budget_buddie/Screens/MainScreens/main_screen.dart';
import 'package:budget_buddie/Screens/Registration/AddPayment/addpayment_screen.dart';
import 'package:budget_buddie/Screens/Registration/Components/in_app_web_view.dart';
import 'package:budget_buddie/Screens/Registration/SetPinScreen/set_pin_binding.dart';
import 'package:budget_buddie/Screens/Registration/SetPinScreen/set_pin_screen.dart';
import 'package:budget_buddie/Screens/Registration/VerifyEmailScreen/verify_email_binding.dart';
import 'package:budget_buddie/Screens/Registration/VerifyEmailScreen/verify_email_screen.dart';
import 'package:budget_buddie/Screens/Registration/registration_binding.dart';
import 'package:budget_buddie/Screens/Registration/registration_screen.dart';
import 'package:budget_buddie/Screens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

import '../Screens/LoginScreens/PasswordLoginScreen/password_login_binding.dart';
import '../Screens/LoginScreens/PasswordLoginScreen/password_login_screen.dart';
import '../Screens/LoginScreens/PinLoginScreen/pin_login_binding.dart';
import '../Screens/LoginScreens/PinLoginScreen/pin_login_screen.dart';
import '../Screens/Registration/AddPayment/addpayment_binding.dart';
import '../Screens/Registration/ConnectAccount/connect_account_binding.dart';
import '../Screens/Registration/ConnectAccount/connect_account_screen.dart';
import '../Screens/Registration/GetStartedScreen/get_started_binding.dart';
import '../Screens/Registration/GetStartedScreen/get_started_screen.dart';
import 'routes.dart';

// const Transition transition = Transition.native;

class AppPages {
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.registrationScreen,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.setPinScreen,
        page: () => const SetPinScreen(),
        binding: SetPinBinding(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.selectPlanScreen,
    //     page: () => const SelectPlanScreen(),
    //     binding: SelectPlanBinding(),
    //     transition: Transition.fadeIn),
    GetPage(
        name: Routes.addPaymentScreen,
        page: () => const AddPaymentScreen(),
        binding: AddPaymentBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.getStartedScreen,
        page: () => const GetStartedScreen(),
        binding: GetStartedBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.connectAccountScreen,
        page: () => const ConnectAccountScreen(),
        binding: ConnectAccountBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.verifyEmailScreen,
        page: () => const VerifyEmailScreen(),
        binding: VerifyEmailBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.pinLoginScreen,
        page: () => const PinLoginScreen(),
        binding: PinLoginBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.passwordLoginScreen,
        page: () => const PasswordLoginScreen(),
        binding: PasswordLoginBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: Routes.dashBoardScreen,
      page: () => const DashBoardScreen(),
      binding: DashBoardBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: Routes.mainScreen,
        page: () => const MainScreen(),
        binding: MainBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.inAppWebViewScreen,
        page: () => const InAppWebViewScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => const ForgotPasswordScreen(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.setupSecurityScreen,
    //     page: () => const SetupSecurityScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.profileScreen,
    //     page: () => const ProfileScreen(),
    //     binding: ProfileBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.notificationScreen,
    //     page: () => const NotificationScreen(),
    //     binding: NotificationBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.budgetDetailScreen,
    //     page: () => const BudgetDetailScreen(),
    //     binding: BudgetDetailBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.budgetSummaryScreen,
    //     page: () => const BudgetSummaryScreen(),
    //     binding: BudgetSummaryBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.menuScreen,
    //     page: () => const MenuScreen(),
    //     binding: MenuBindings(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.accountScreen,
    //     page: () => const AccountScreen(),
    //     binding: AccountBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.editYourBudgetScreen,
    //     page: () => const EditYourBudgetScreen(),
    //     binding: EditYourBudgetBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.editYourGoalBudgetScreen,
    //     page: () => const EditYourGoalBudgetScreen(),
    //     binding: EditYourGoalBudgetBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.cashflowScreen,
    //     page: () => const CashflowScreen(),
    //     binding: CashflowBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.goalsScreen,
    //     page: () => const GoalsScreen(),
    //     binding: GoalsBindings(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.connectYourAccountScreen,
    //     page: () => const ConnectYourAccountScreen(),
    //     binding: ConnectYourAccountBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.changePasswordScreen,
    //     page: () => const ChangePasswordScreen(),
    //     binding: ChangePasswordBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.addCashAccountScreen,
    //     page: () => const AddCashAccountScreen(),
    //     binding: AddCashAccountBinding(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.goalsDetailScreen,
    //     page: () => const GoalsDetailScreen(),
    //     binding: GoalsDetailBinding(),
    //     transition: Transition.fadeIn),
    //      GetPage(
    //     name: Routes.addGoalScreen,
    //     page: () => const AddGoalScreen(),
    //     binding: AddGoalBinding(),
    //     transition: Transition.fadeIn),
    //        GetPage(
    //     name: Routes.retirementPlannerScreen,
    //     page: () => const RetirementPlannerScreen(),
    //     binding: RetirementPlannerBinding(),
    //     transition: Transition.fadeIn),
    //     GetPage(
    //     name: Routes.addAccountAssetScreen,
    //     page: () => const AddAccountAssetScreen(),
    //     binding: AddAccountAssetBinding(),
    //     transition: Transition.fadeIn),
    //      GetPage(
    //     name: Routes.accountDetailScreen,
    //     page: () => const AccountDetailScreen(),
    //     binding: AccountDetailBinding(),
    //     transition: Transition.fadeIn),
  ];
}
