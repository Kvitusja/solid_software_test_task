import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Color decorationColour;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController fieldController;
 final void Function(String?) onChanged;
  const TextFormFieldWidget({
    Key? key,
    this.validator,
    required this.fieldController,
    required this.decorationColour, required this.onChanged, this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return TextFormField(
        style: TextStyle(color: decorationColour),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: validator,
        keyboardType: TextInputType.number,
        controller: fieldController,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: decorationColour),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orangeAccent),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: decorationColour),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: onChanged,
      );
    });
  }
}
