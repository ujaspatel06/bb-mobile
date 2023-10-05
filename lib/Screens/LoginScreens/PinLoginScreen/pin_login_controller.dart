import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PinLoginController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> getGoogleSignIn() async {
    try {
      var result = await googleSignIn.signIn();
      debugPrint("$result");
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
