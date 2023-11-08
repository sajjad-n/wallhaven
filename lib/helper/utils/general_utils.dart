import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

SnackbarController showSnackBar({String? message, SnackBarStyles? style}) {
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
      messageText: SnackBarWidget(message: message, style: style),
    ),
  );
}

Future<bool> isConnectionAvailable() async {
  return (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
}

String formatBytes(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  } else if (bytes < 1024 * 1024) {
    double kb = bytes / 1024;
    return '${kb.toStringAsFixed(1)} KB';
  } else if (bytes < 1024 * 1024 * 1024) {
    double mb = bytes / (1024 * 1024);
    return '${mb.toStringAsFixed(1)} MB';
  } else if (bytes < 1024 * 1024 * 1024 * 1024) {
    double gb = bytes / (1024 * 1024 * 1024);
    return '${gb.toStringAsFixed(1)} GB';
  } else {
    double tb = bytes / (1024 * 1024 * 1024 * 1024);
    return '${tb.toStringAsFixed(1)} TB';
  }
}

Future<void> launchUrlIntent(Uri uri) async {
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    printLog('Could not launch $uri');
  }
}
