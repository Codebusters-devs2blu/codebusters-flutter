import 'package:flutter/material.dart';
import 'package:flutter_hackaton/app/core/ui/ui_config.dart';

// ignore: must_be_immutable
class TextFieldOutline extends StatelessWidget {
  final String label;
  final TextEditingController? control;
  bool? obscureText;
  String? Function(String?)? validatorless;
  ValueChanged<String>? onTap;

  TextFieldOutline({required this.label, this.control, this.validatorless, this.onTap, this.obscureText, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 2.0, top: 6.0),
          child: SizedBox(
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF403E3E), fontSize: 12),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white), 
            borderRadius: BorderRadius.circular(10.0), 
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: TextFormField(
              obscureText: (obscureText ?? false),
              onChanged: onTap,
              validator: validatorless,
              controller: control,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10.0), 
                fillColor: UiConfig.colorScheme.outline,
                filled: true, 
                border:
                    InputBorder.none, 
              ),
            ),
          ),
        ),
      ],
    );
  }
}
