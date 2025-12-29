import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// position: 0 = left, 1 = right
class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int position;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = position == 0
        ? const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          );
    return ChoiceChip(
      showCheckmark: false,
      label: Text(label),
      selected: selected,
      selectedColor: const Color(AppColors.chipSelectedColor),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      onSelected: (_) => onTap(),
    );
  }
}
