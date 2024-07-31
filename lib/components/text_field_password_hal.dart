import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFieldPasswordHal extends StatelessWidget {

  final GlobalKey<FormBuilderState> _componentKey = GlobalKey<FormBuilderState>();

  final String name;
  final double width;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  TextFieldPasswordHal({super.key,
    required this.controller, 
    required this.name,
    required this.width,
    this.validator
  });

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        width: width,
        height: 40,
        child: TextFormField(
          key: _componentKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          style: GoogleFonts.getFont(
                  'Fredoka',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF000000),
          ),
          decoration: InputDecoration(
            labelText: name != '' ? name : '',
            filled: true,
            fillColor: Colors.transparent,
            errorStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),        
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            labelStyle: GoogleFonts.getFont(
                  'Fredoka',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF000000),
            ),
            ),
          obscureText: true,
          validator: validator
        ),
      ),
    );
  }
}
