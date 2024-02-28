import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFieldTitle extends StatefulWidget {
  const CustomTextFieldTitle(
      {Key? key,
        required this.controller,
        required this.fieldTitle,
        this.validator,
        this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final String fieldTitle;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  State<CustomTextFieldTitle> createState() => _CustomTextFieldTitleState();
}

class _CustomTextFieldTitleState extends State<CustomTextFieldTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
           SizedBox(height: 1.h,),
          TextFormField(
            obscureText: false,
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.all(15),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}