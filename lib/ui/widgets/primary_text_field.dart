import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({super.key, required this.hint, this.controller});
  final String hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(4, 4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-4, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration.collapsed(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF707070)),
        ),
        inputFormatters: [_CommaToDotInputFormatter()],
      ),
    );
  }
}

class _CommaToDotInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(',', '.');
    return newValue.copyWith(
      text: newText,
      selection: newValue.selection,
    );
  }
}
