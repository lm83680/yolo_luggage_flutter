import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:yolo_luggage/common/commpent/copyrigth.dart';
import 'package:yolo_luggage/common/style/color.dart';

import 'index.dart';

class InstructionsPage extends GetView<InstructionsController> {
  const InstructionsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text("一、介绍"),
            subtitle: Text(
                "本软件识别范围包括行李箱、手提箱、背包、单肩包等常见行李。依据中国大陆国内航班随身行李限制标准，“非超大行李”定义为行李长、宽、高三边分别不得超过55厘米（22英寸）、40厘米（16英寸）、20厘米（8英寸）,否则为“超大行李”。"),
          ),
          ListTile(
            title: Text("二、日常模式使用"),
            subtitle: Text(
                "1. 请尽量保持图像无其他杂物\n2. 拍摄时，人物将携带的行李放置在身边。\n3.图像1：人物正面和行李的正面。详见示例\n4.图像2：人物正面和行李的侧面。详见示例\n5. 上传图像完成后，设置图像中人物的身高。\n6.点击开始识别，等待识别结果。"),
          ),
          ListTile(
            title: Text("三、安检模式说明和使用"),
            subtitle: Text(
                "安检模式要求双摄像机分别固定位置拍摄，且摄得行李所在空间平面高度为200cm，摄像机1拍摄行李正面，摄像机2拍摄行李侧面。\n本软件中，已经存在工作流，您可以追加拍摄的图像（请注意保持上述机位规范）\n使用方式\n1. 点击开始执勤，将自动按照工作流处理任务\n2. 点击工作流尾部 + 图标，向工作流追加任务。\n3.若判断到有超大行李，将在结果中在展示，点击处理进行人工处理。"),
          ),
          ListTile(
            title: Text('四、各航空公司限制详情'),
            subtitle: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("名称"),
                    Text("随身携带限制"),
                    Text("托运限制"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("中国国际航空"),
                    Text("55cm*40cm*20cm"),
                    Text("三边之和不超过203厘米"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("南方航空"),
                    Text("55cm*40cm*20cm"),
                    Text("三边之和不超过203厘米"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("海南航空"),
                    Text("55cm*40cm*20cm"),
                    Text("40cm*60cm*100cm"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("东方航空"),
                    Text("55cm*40cm*20cm"),
                    Text("40cm*60cm*100cm"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("深圳航空"),
                    Text("55cm*40cm*20cm"),
                    Text("40cm*60cm*100cm"),
                  ],
                ),
              ],
            ),
          ),
          ListTile(title: Text('五、日常模式图像示例')),
          Row(
            children: [
              SizedBox(width: 12),
              Expanded(child: Container(
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xaae8e8e8)),
                child: Image.asset(
                  "assets/images/sample1.png",
                  fit: BoxFit.cover,
                ),
              )),
               SizedBox(width: 12),
              Expanded(child: Container(
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xaae8e8e8)),
                child: Image.asset(
                  "assets/images/sample2.png",
                  fit: BoxFit.cover,
                ),
              )),
               SizedBox(width: 12),
            ],
          ),
          CopyrigthBox()
        ].animate().fade(delay: 50.ms),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructionsController>(
      init: InstructionsController(),
      id: "instructions",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("软件使用说明书")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
