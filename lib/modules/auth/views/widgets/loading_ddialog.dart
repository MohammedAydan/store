import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> loadingDialog() => Get.dialog(
      const LoadingDdialog(),
      barrierDismissible: false,
    );

class LoadingDdialog extends StatelessWidget {
  const LoadingDdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Card.filled(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          ),
        ),
      ),
    );
  }
}
