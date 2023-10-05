// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  // static String dateConvertor(DateTime dateTime) {
  //   String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  //   return formattedDate;
  // }

  // static DateTime stringToDateConvertor(String dateTime) {
  //   DateTime formattedDate = DateFormat('dd/MM/yyyy').parse(dateTime);
  //   return formattedDate;
  // }

  // static Timestamp stringToTimeStamp(String date) {
  //   // Convert the string to DateTime
  //   DateTime dateTime = stringToDateConvertor(date);

  //   // Convert the DateTime to Firebase Timestamp
  //   Timestamp timestamp = Timestamp.fromDate(dateTime);

  //   return timestamp;
  // }

  // static String timeStampToString(Timestamp timestamp) {
  //   // Convert the Timestamp to DateTime
  //   DateTime dateTime = timestamp.toDate();

  //   // Format the DateTime to String
  //   String formattedDateTime = dateConvertor(dateTime);
  //   return formattedDateTime;
  // }

  // /// Open image gallery and pick an image
  // static Future<XFile?> pickImageFromGallery() async {
  //   return await ImagePicker().pickImage(source: ImageSource.gallery);
  // }

  // /// Open image gallery and pick an image
  // static Future<XFile?> pickImageFromCamera() async {
  //   return await ImagePicker().pickImage(source: ImageSource.camera);
  // }

  // /// Pick Image From Gallery and return a File
  // static Future<CroppedFile?> cropSelectedImage(String filePath) async {
  //   return await ImageCropper().cropImage(
  //     sourcePath: filePath,
  //     // aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: AppColor.blackColor,
  //           toolbarWidgetColor: AppColor.blueColor,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Crop Image',
  //         aspectRatioLockEnabled: false,
  //         minimumAspectRatio: 1.0,
  //         aspectRatioPickerButtonHidden: false,
  //       ),
  //     ],
  //   );
  // }
}

DateTime parseCustomFormat(String date) {
  final parts = date.split('-');
  final formatted = '${parts[2]}-${parts[0]}-${parts[1]}';
  return DateTime.parse(formatted);
}

String parseTimeStampToString(String inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate);
  String formattedDate = DateFormat('MM-dd-yyyy').format(parsedDate);
  return formattedDate;
}

String colorToString(Color color) {
  try {
    String colorString = color.value.toRadixString(16).toUpperCase();
    return colorString;
  } catch (e) {
    return Colors.white.value.toRadixString(16).toUpperCase();
  }
}

Color stringToColor(String colorString) {
  try {
    Color color = Color(int.parse(colorString, radix: 16));
    return color;
  } catch (e) {
    return Color(int.parse("FFFFB26B", radix: 16));
  }
}

Color colorToDarkColor(Color color, [double amount = .1]) {
  final hsl = HSLColor.fromColor(color);
  final darkness = (1.0 - amount).clamp(0.0, 1.0);
  return hsl
      .withLightness((hsl.lightness * darkness).clamp(0.0, 1.0))
      .toColor();
}
