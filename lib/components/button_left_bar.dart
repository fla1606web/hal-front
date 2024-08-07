import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonLeftBar extends StatefulWidget {
  const ButtonLeftBar({super.key, required this.image, required this.url});
  final String image;
  final String url;
  @override
  State<ButtonLeftBar> createState() => _ButtonLeftBarState();
}

class _ButtonLeftBarState extends State<ButtonLeftBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      child: IconButton(
        iconSize: 72,
        icon: SvgPicture.asset(
          widget.image,
        ),
        onPressed: () => (Navigator.pushNamed(context, widget.url)),
      ),
    );
  }
}
