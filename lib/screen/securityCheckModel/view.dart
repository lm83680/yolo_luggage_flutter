import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/commpent/click.dart';
import 'package:yolo_luggage/common/commpent/copyrigth.dart';
import 'package:yolo_luggage/common/style/color.dart';

import 'index.dart';

class SecuritycheckmodelPage extends GetView<SecuritycheckmodelController> {
  const SecuritycheckmodelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecuritycheckmodelController>(
      init: SecuritycheckmodelController(),
      id: "securitycheckmodel",
      builder: (_) {
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
              Text("摄像机所摄传送带所在平面高度", style: TextStyle(color: grayText)),
              Expanded(child: SizedBox()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 4),
                  Text("200", style: TextStyle(fontSize: 18)),
                  SizedBox(width: 4),
                  Text("cm"),
                  SizedBox(width: 4),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Row(
          children: [
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
                      child: Image.asset('assets/images/sample_security1.png',
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
                      child: Image.asset('assets/images/sample_security2.png',
                          fit: BoxFit.cover),
                    ))),
            SizedBox(width: 24),
          ],
        ),
        SizedBox(height: 24),
        Text(
          "距离下次执行识别还剩 15 s",
          style: TextStyle(color: grayText, fontSize: 12),
        ),
        SizedBox(height: 12),
        ClickAnimated(
            onClick: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: orange,
              ),
              child: Center(
                child: Text(
                  "开始执勤",
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
        Row(
          children: [
            SizedBox(width: 24),
            Expanded(
                child: Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 12),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xaae8e8e8)),
                    child: Image.asset('assets/images/sample2_add.png',
                        fit: BoxFit.cover),
                  ).animate().fade(duration: 500.ms);
                }),
                itemCount: 12,
              ),
            )),
            SizedBox(width: 8),
            Column(
              children: [
                ClickAnimated(
                    onClick: () {
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
                                    ListTile(title: Text("添加新任务")),
                                    Row(
                                      children: [
                                        SizedBox(width: 24),
                                        Expanded(
                                            child: ClickAnimated(
                                                onClick: () {},
                                                child: Container(
                                                  width: double.infinity,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Color(0xaae8e8e8)),
                                                  child: Image.asset(
                                                      'assets/images/sample_security1.png',
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                      color: Color(0xaae8e8e8)),
                                                  child: Image.asset(
                                                      'assets/images/sample_security2.png',
                                                      fit: BoxFit.cover),
                                                ))),
                                        SizedBox(width: 24),
                                      ],
                                    ),
                                    Expanded(
                                        child: Center(
                                      child: ClickAnimated(
                                          onClick: () {},
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 24),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: bule,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "确认添加",
                                                style: TextStyle(
                                                    color: white, fontSize: 16),
                                              ),
                                            ),
                                          )),
                                    )),
                                  ],
                                ))),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: bule,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Text(
                        "添加新任务",
                        style: TextStyle(color: white, fontSize: 12),
                      ),
                    )),
                SizedBox(height: 4),
                Text("当前剩余 2 任务", style: TextStyle(color: white, fontSize: 10))
              ],
            ),
            SizedBox(width: 24),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Divider(
            color: gray,
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Text("识别结果："),
              Text(
                "注意！有行李属于超大行李",
                style: TextStyle(color: red),
              )
            ],
          ),
        ),
        Column(
          children: [
            ListTile(
              onTap: () {
                Get.dialog(Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Card(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Color(0xaae8e8e8)),
                          child: Image.asset('assets/images/test.jpg',
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 24),
                        Text("该行李尺寸大小应为20cm*60cm*50cm"),
                        SizedBox(height: 24),
                        ClickAnimated(
                              onClick: () => Get.back(),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: bule,
                                ),
                                child: Center(
                                  child: Text(
                                    "确认",
                                    style:
                                        TextStyle(color: white, fontSize: 16),
                                  ),
                                ),
                              )),
                              SizedBox(height: 24),
                        ClickAnimated(
                              onClick: () => Get.back(),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: green,
                                ),
                                child: Center(
                                  child: Text(
                                    "标记为已处理",
                                    style:
                                        TextStyle(color: white, fontSize: 16),
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox())
                  ],
                ));
              },
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 16),
              leading: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/test.jpg',
                          fit: BoxFit.cover))),
              title: Text("该行李为标准行李",
                  style: TextStyle(color: green, fontSize: 14)),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 16),
              leading: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/test.jpg',
                          fit: BoxFit.cover))),
              title: Text("该行李为标准行李",
                  style: TextStyle(color: green, fontSize: 14)),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 16),
              leading: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/test.jpg',
                          fit: BoxFit.cover))),
              title: Text("该行李可能为超大行李",
                  style: TextStyle(color: red, fontSize: 14)),
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: green,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  "处理",
                  style: TextStyle(color: white, fontSize: 12),
                ),
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 16),
              leading: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/test.jpg',
                          fit: BoxFit.cover))),
              title: Text("该行李可能为超大行李(已处理)",
                  style: TextStyle(color: orange, fontSize: 14)),
            ),
          ],
        ),
        CopyrigthBox()
      ].animate().fade(),
    );
      },
    );
  }
}
