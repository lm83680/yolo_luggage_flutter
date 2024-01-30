import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/commpent/click.dart';
import 'package:yolo_luggage/common/commpent/copyrigth.dart';
import 'package:yolo_luggage/common/style/color.dart';
import 'dart:ui' as ui;

import 'index.dart';

class DayusemodelPage extends GetView<DayusemodelController> {
  const DayusemodelPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.only(left: 16, right: 4, top: 8, bottom: 8),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: new Border.all(width: 1, color: gray),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Text("您的身高", style: TextStyle(color: grayText)),
              Expanded(child: SizedBox()),
              InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            margin: EdgeInsets.all(14),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            "确认",
                                            style: TextStyle(color: orange),
                                          ),
                                        )),
                                    Expanded(
                                      child: CupertinoPicker(
                                        itemExtent: 32, // 每个选项的高度
                                        onSelectedItemChanged: (index) =>
                                            controller.onChangeSelectedHeight(
                                                (index * 5) + 100),
                                        scrollController:
                                            FixedExtentScrollController(
                                          initialItem:
                                              (controller.selectedHeight -
                                                      100) ~/
                                                  5,
                                        ),
                                        children: List.generate(
                                          (210 - 100) ~/ 5 + 1, // 计算有多少个步进值
                                          (index) {
                                            int height =
                                                index * 5 + 100; // 计算每个选项的身高值
                                            return Center(
                                              child: Text('$height cm'),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                        backgroundColor: Colors.transparent);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 4),
                      Text("${controller.selectedHeight}",
                          style: TextStyle(fontSize: 18)),
                      SizedBox(width: 4),
                      Text("cm"),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(height: 24),
        Row(
          children: [
            SizedBox(width: 24),
            Expanded(
                child: ClickAnimated(
                    onClick:  ()=>controller.getImage('frontView'),
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xaae8e8e8)),
                      child: Image.asset('assets/images/sample1_add.png',
                          fit: BoxFit.cover),
                    ))),
            SizedBox(width: 24),
            Expanded(
                child: ClickAnimated(
                    onClick: () {},
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Color(0xaae8e8e8)),
                      child: Image.asset('assets/images/sample2_add.png',
                          fit: BoxFit.cover),
                    ))),
            SizedBox(width: 24),
          ],
        ),
        SizedBox(height: 24),
        ClickAnimated(
            onClick: controller.start,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: gray,
              ),
              child: Center(
                child: Text(
                  "开始识别",
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.all(16),
          child: Divider(
            color: gray,
          ),
        ),
        controller.resultData == null ? SizedBox() : Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text("识别结果："),
                  Text(
                    "属于超大行李",
                    style: TextStyle(color: red),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 24),
                Expanded(
                  child: RadiusPicBox(Image.asset('assets/images/sample1.png',
                      fit: BoxFit.cover)),
                ),
                SizedBox(width: 24),
                Expanded(
                    child: RadiusPicBox(Image.asset('assets/images/sample1.png',
                      fit: BoxFit.cover)
                )),
                SizedBox(width: 24),
              ],
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "您的行李尺寸约为 40cm * 20cm * 20cm\n以下为各航空公司具体判断结果。",
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 80,
                            child: Text(
                              "名称",
                              textAlign: TextAlign.center,
                            )),
                        Text("随身携带该行李"),
                        Text("托运该行李"),
                      ],
                    ),
                    Divider(
                      color: gray,
                    ),
                    SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 100, child: Text("中国国际航空")),
                            cannot(),
                            cannot(),
                          ],
                        )),
                  ],
                ))
          ],
        ),
        CopyrigthBox()
      ],
    );
  }

  Widget cannot() {
    return Icon(
      Icons.close_rounded,
      color: red,
    );
  }

  Widget can() {
    return Icon(
      Icons.done_rounded,
      color: green,
    );
  }

  Widget RadiusPicBox(Widget child) {
    return Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Color(0xaae8e8e8)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DayusemodelController>(
      init: DayusemodelController(),
      id: "dayusemodel",
      builder: (_) {
        return _buildView();
      },
    );
  }
}