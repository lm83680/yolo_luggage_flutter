import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class DayusemodelController extends GetxController {
  DayusemodelController();

  int selectedHeight = 170;
  Map datasets ={
    "frontView":null,
    "sideView":null
  };
  ResultData? resultData = null;

  //开始识别
  void start(){
    if(Get.isSnackbarOpen)return;
    if(datasets['frontView']==null){
      Get.snackbar("无法开始","需要上传正面图");
      return;
    }
    if( datasets['sideView']==null){
      Get.snackbar("无法开始","需要上传侧面图");
      return;
    }
  }

  Future getImage(String key) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
      sourcePath: image.path,
      maxWidth: 900,
      maxHeight: 1200,
    ); 
    if (croppedFile != null) {

    }
  }

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

  Future<ui.Image> loadIamge(String path) async {
    // 加载资源文件
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    return image;
  }
}

class ResultData {
  String labelName;
  Image resultpic1;
  Image resultpic2;
  String long;
  String width;
  String height;
  // 构造函数
  ResultData({
    required this.labelName,
    required this.resultpic1,
    required this.resultpic2,
    required this.long,
    required this.width,
    required this.height,
  });

  // toJson 函数，用于将对象转换为 JSON 格式
  Map<String, dynamic> toJson() {
    return {
      'labelName': labelName,
      'resultpic1': resultpic1,
      'resultpic12': resultpic2,
      'long': long,
      'width': width,
      'height': height,
    };
  }
}

class ImageWithRectanglePainter extends CustomPainter {
  final ui.Image image;
  ImageWithRectanglePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制图像
    paintImage(
        canvas: canvas,
        rect: Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
        image: image,
        fit: BoxFit.fill);

    // 计算矩形框的位置和大小信息
    double centerX = size.width * 0.58;
    double centerY = size.height * 0.7;
    double rectWidth = size.width * 0.1;
    double rectHeight = size.height * 0.12;

    // 绘制矩形框
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Rect rect = Rect.fromCenter(
        center: Offset(centerX, centerY), width: rectWidth, height: rectHeight);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
