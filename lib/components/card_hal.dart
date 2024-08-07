import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHal extends StatefulWidget {
  const CardHal(
      {super.key,
      required this.screenWidth,
      required this.name,
      required this.subtitle,
      required this.url});

  final double screenWidth;
  final String name;
  final String subtitle;
  final String url;

  @override
  State<CardHal> createState() => _CardHalState();
}

class _CardHalState extends State<CardHal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF000000)),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Container(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: widget.screenWidth < 400 ? 35 : 50,
                    height: widget.screenWidth < 400 ? 35 : 50,
                    child: SvgPicture.asset(
                      'assets/vectors/gallery_1_x2.svg',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 2, 0, 4),
                    child: RichText(
                      text: TextSpan(
                        text: widget.name,
                        style: GoogleFonts.getFont(
                          'Fredoka',
                          fontWeight: FontWeight.w400,
                          fontSize: widget.screenWidth < 600 ? 13 : 18,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: RichText(
                      text: TextSpan(
                        text: widget.subtitle,
                        style: GoogleFonts.getFont(
                          'Fredoka',
                          fontWeight: FontWeight.w400,
                          fontSize: widget.screenWidth < 600 ? 11 : 15,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
