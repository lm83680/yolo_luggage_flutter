import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/commpent/click.dart';
import 'package:yolo_luggage/common/style/color.dart';
import 'package:yolo_luggage/screen/instructions/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text("超大行李智能识别", style: TextStyle(fontSize: 24)),
              const Expanded(child: SizedBox(height: 80)),
              ClickAnimated(
                  onClick: () {
                    controller.showloading ? null :
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
                                              color: controller.isDayUse?green:orange,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "切换到${controller.isDayUse?'安检':'日常'}模式",
                                                style: TextStyle(color: white),
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
                                              onPressed: () =>
                                                  Get.to(InstructionsPage()),
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
                      color: controller.isDayUse ?  orange : green,
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
        controller.isDayUse ? dayUseModel():securityCheckModel()
      ],
    );
  }
  Widget dayUseModel(){
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
        )
      ],
    );
  }

  Widget securityCheckModel(){
    return Container(
      height: 100,
      width: 200,
      color: orange,
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
