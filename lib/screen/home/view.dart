import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/commpent/click.dart';
import 'package:yolo_luggage/common/commpent/copyrigth.dart';
import 'package:yolo_luggage/common/style/color.dart';
import 'package:yolo_luggage/screen/instructions/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text("超大行李智能识别", style: TextStyle(fontSize: 24)),
              const Expanded(child: SizedBox(height: 80)),
              ClickAnimated(
                  onClick: () {
                    controller.showloading
                        ? null
                        : Get.bottomSheet(
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                margin: EdgeInsets.all(14),
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () => Get.back(),
                                              child: Text("取消"),
                                            )),
                                        Expanded(
                                            child: Column(children: [
                                          ClickAnimated(
                                              onClick: () =>
                                                  controller.onChangeModel(),
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 24),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  color: controller.isDayUse
                                                      ? green
                                                      : orange,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "切换到${controller.isDayUse ? '安检' : '日常'}模式",
                                                    style:
                                                        TextStyle(color: white),
                                                  ),
                                                ),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.help_outline_rounded,
                                                size: 14,
                                              ),
                                              SizedBox(width: 4),
                                              TextButton(
                                                  onPressed: () => Get.to(
                                                      InstructionsPage()),
                                                  child: Text("查看软件使用说明书")),
                                            ],
                                          ),
                                          ListTile(
                                            title: Text('行李识别尺寸说明'),
                                            subtitle: Text(
                                                "依据中国大陆国内航班随身行李限制标准，“非超大行李”定义为行李长、宽、高三边分别不得超过55厘米（22英寸）、40厘米（16英寸）、20厘米（8英寸）,否则为“超大行李”。"),
                                          ),
                                        ]))
                                      ],
                                    ))),
                            backgroundColor: Colors.transparent);
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: controller.isDayUse ? orange : green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 14),
                        Text(
                          controller.isDayUse ? "日常模式" : "安检模式",
                          style: TextStyle(color: white),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.help_outline_rounded,
                          color: white,
                          size: 14,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        controller.isDayUse ? dayUseModel() : securityCheckModel()
      ],
    ));
  }

  Widget dayUseModel() {
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
                    onClick: () {},
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
            onClick: () => controller.onChangeModel(),
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
        Column(
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
                    child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xaae8e8e8)),
                  child: Image.asset('assets/images/sample1_add.png',
                      fit: BoxFit.cover),
                )),
                SizedBox(width: 24),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xaae8e8e8)),
                  child: Image.asset('assets/images/sample2_add.png',
                      fit: BoxFit.cover),
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

  Widget securityCheckModel() {
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
            onClick: () => controller.onChangeModel(),
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
