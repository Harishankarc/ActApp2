import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final double borderRadius;

  const AppCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.orange,
    this.checkColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(color: borderColor, width: 1.5),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
