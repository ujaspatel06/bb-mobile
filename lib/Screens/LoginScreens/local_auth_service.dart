import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    bool didAuthenticate = false;
    try {
      if (!await _canAuthenticate()) return false;
      final List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();

      debugPrint("$availableBiometrics");
      if (availableBiometrics.isNotEmpty) {
        if (availableBiometrics.contains(BiometricType.face) ||
            availableBiometrics.contains(BiometricType.strong)) {
          didAuthenticate = await _auth.authenticate(
              localizedReason: 'Please authenticate to Login',
              options: const AuthenticationOptions(
                  biometricOnly: true, useErrorDialogs: true));
        }
      }
      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        debugPrint('handling of no hardware here');
      } else if (e.code == auth_error.notEnrolled) {
        debugPrint("${e.message}");
      } else {
        debugPrint("${e.message}");

      }
      return false;
    }
  }
}
