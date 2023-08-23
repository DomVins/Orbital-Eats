import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final double height;

  const SmallText(
      {Key? key,
      required this.text,
      this.size = 0,
      this.color = Colors.grey,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(color: color, fontSize: size == 0 ? 12 : size, height: height),
    );
  }
}
