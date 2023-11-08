import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:get/get.dart';

import '../../view/widgets/widgets.dart';
import '../constants/constants.dart';

void printLog(dynamic params) {
  final prettyPrintedData = '---\n${params.toString()}\n---';
  if (kDebugMode) {
    if (GetPlatform.isMobile && params.toString().length > 1020) {
      dev.log(prettyPrintedData);
    } else {
      print(prettyPrintedData);
    }
  }
}

double get textScaleFactor => Get.width / GeneralConst.designWidth;

SnackbarController showSnackBar(String? message) {
  return Get.showSnackbar(
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * 0.02,
        vertical: Get.width * 0.05,
      ),
      dismissDirection: DismissDirection.up,
      backgroundColor: Colors.transparent,
      duration: GeneralConst.snackBarDuration,
      messageText: SnackBarWidget(message: message),
    ),
  );
}

Future<bool> isConnectionAvailable() async {
  return (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
}
