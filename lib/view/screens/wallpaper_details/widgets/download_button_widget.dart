import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../helper/constants/constants.dart';
import '../../../theme/theme.dart';

class DownloadButtonWidget extends StatelessWidget {
  final String? label;
  final double? progress;
  final VoidCallback? onDownload;
  final VoidCallback? onCancel;

  const DownloadButtonWidget({
    super.key,
    this.label,
    this.progress,
    this.onDownload,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: progress == null ? Get.width : Get.height * 0.08,
      height: Get.height * 0.08,
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        onPressed: progress == null ? onDownload : onCancel,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  progress == null ? Get.height * 1.0 : 360.0),
            ),
          ),
        ),
        child: progress == null
            ? Text(
                label ?? '',
                textScaleFactor: 1.0,
                style: Get.textTheme.titleLarge,
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                    value: progress,
                    strokeWidth: Get.height * 0.006,
                    backgroundColor: AppColors.violetBlue,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AssetsConst.rotatedAdd,
                      color: Colors.white,
                      width: Get.height * 0.12,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
