
import 'package:flutter/material.dart';
class CustomField extends StatelessWidget {
  final String hinText;
  final TextEditingController? controller;
  final bool isObscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomField({super.key, required this.hinText
    , required this.controller
    , this.isObscureText = false,
    this.readOnly = false,
    this.onTap,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hinText",
      ),
      validator: (val){
        if(val!.trim().isEmpty){
          return "$hinText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
