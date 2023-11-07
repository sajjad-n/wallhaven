import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;

import 'package:get/get.dart';

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
