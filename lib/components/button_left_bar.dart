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
    return SizedBox(
      width: 43,
      height: 43,
      child: IconButton(
        iconSize: 70,
        icon: SvgPicture.asset(
          widget.image,
        ),
        onPressed: () => (Navigator.pushNamed(context, widget.url)),
      ),
    );
  }
}
