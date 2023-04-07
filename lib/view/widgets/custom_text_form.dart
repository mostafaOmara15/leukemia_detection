import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class CustomTextField extends StatelessWidget {

  TextEditingController fieldCtrl;
  String fieldHint;
  TextInputType? keyBoardType;
  bool onlyRead;
  Function()? doing;

  CustomTextField(
    {
      required this.fieldCtrl,
      required this.fieldHint,
      this.keyBoardType,
      this.doing,
      required this.onlyRead
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldCtrl,
      keyboardType: keyBoardType,
      onTap: doing,
      readOnly: onlyRead,
      cursorColor: ColorManager.primaryColor,
      decoration: InputDecoration(
        hintText: fieldHint,
        hintStyle: const TextStyle(color: ColorManager.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ColorManager.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: ColorManager.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
