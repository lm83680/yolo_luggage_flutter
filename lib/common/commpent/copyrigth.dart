import 'package:flutter/cupertino.dart';
import 'package:yolo_luggage/common/style/color.dart';

class CopyrigthBox extends StatelessWidget {
  const CopyrigthBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            Text("copyrigth © 覃昌腾 2024",style: TextStyle(color: grayText,fontSize: 12),),
            Text("开源协议 Apache License 2.0",style: TextStyle(color: grayText,fontSize: 12))
          ],
        ),
      ),
    );
  }
}