import 'package:get/get.dart';

class DayusemodelController extends GetxController {
  DayusemodelController();
  
  int selectedHeight = 170;
  _initData() {
    update(["dayusemodel"]);
  }

  void onChangeSelectedHeight(int value) {
    selectedHeight = value;
    update(["dayusemodel"]);
  }

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
