import 'package:flutter/material.dart';

///被该组件包裹的元素会在点击后略微缩小 - 效果参考appStore卡片
class ClickAnimated extends StatefulWidget {

  const ClickAnimated(
      {Key? key,required this.child, required this.onClick, this.scale = 0.95})
      : super(key: key);
  final Widget child;
  final Function onClick;
  final double scale;

  @override
  State<ClickAnimated> createState() => _ClickAnimatedState();
}

class _ClickAnimatedState extends State<ClickAnimated> {
  bool _isClick = false;
  bool _longStart = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => {
              widget.onClick(),
            },
        onLongPressDown: (downElement) => {
              setState(() {
                _isClick = true;
              }),
          ///必须解决该组件在滑动视图中异常的BUG
              Future.delayed(const Duration(milliseconds: 501), () {
                try{
                  setState(() {
                    _isClick = _longStart ? true : false;
                  });
                }catch(e){
                  ///结束时若组件去去除会报错，忽略即可
                }
              })
            },
        onLongPressStart: (se) => {
              setState(() {
                _longStart = true;
                _isClick = true;
              }),
            },
        onLongPressCancel: () => {
              setState(() {
                _isClick = false;
              })
            },
        onLongPressEnd: (endElement) => {
              setState(() {
                _isClick = false;
                _longStart = false;
              }),
              if (endElement.velocity.pixelsPerSecond.dx == 0) {widget.onClick()},
            },
        child: AnimatedScale(
          duration: const Duration(milliseconds: 600),
          scale: _isClick ? widget.scale : 1.0,
          curve: Curves.decelerate,
          child: widget.child,
        ));
  }
}
