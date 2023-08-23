import 'package:flutter/material.dart';

class CatText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow overFlow;
  const CatText(
      {Key? key,
      required this.text,
      this.size = 0,
      this.color = Colors.black,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? 14 : size,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5),
    );
  }
}
