import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/style/color.dart';

class HomeController extends GetxController {
  HomeController();
  bool isDayUse = true; //日常模式
  bool showloading = false;
  _initData() async {
    isDayUse = (await AdaptiveTheme.getThemeMode()) == AdaptiveThemeMode.light
        ? true
        : false;
    update(["home"]);
  }


  void onChangeModel() async {
    Get.back();
    isDayUse
        ? AdaptiveTheme.of(Get.context!).setDark()
        : AdaptiveTheme.of(Get.context!).setLight();
    isDayUse = !isDayUse;
    showloading = true;
    Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.1),
              ),
              child: CupertinoActivityIndicator(
                color: white,
                radius: 16,
              )),
        ),
        barrierDismissible: false);
    update(["home"]);
    await Future.delayed(Duration(milliseconds: 500));
    Get.back();
    setShemeColor(!isDayUse);
    showloading = false;
    update(["home"]);
  }

  void setShemeColor(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(isDark?SystemUiOverlayStyle.light:SystemUiOverlayStyle.dark);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
