import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Handler {
  static final Handler _singleton = Handler._internal();

  factory Handler() {
    return _singleton;
  }
  Handler._internal();
  // Handler({this.errorString, this.retryPressed});
  Future<AlertDialog?> loading() => showDialog(
        barrierDismissible: false,
        builder: (ctx) => Center(
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 60,
                height: 60,
                child: const CircularProgressIndicator(
                  strokeWidth: 1.5,
                  semanticsLabel: "Loadinf",
                ))),
        context: Get.context!,
      );

  void errorSnackBar(String msg) => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: msg,
      title: 'Error!',
      duration: const Duration(seconds: 3));
  void noInternetSnackBar() => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: "Please check your Internet Connection!",
      title: 'No Internet');
  void getInternetSnackBar() => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: "Internet connection has been restored",
      title: 'Internet Restored');
}
