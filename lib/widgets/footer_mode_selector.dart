import 'package:flutter/material.dart';
import 'package:perpelxity_clone/Theme/colors.dart';

class FooterModeSelector extends StatefulWidget {
  // final String label;
  final IconData icon;
  final String popupText;
  final VoidCallback onTap;
  final bool isSelected;

  const FooterModeSelector({
    Key? key,
    // required this.label,
    required this.icon,
    required this.popupText,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<FooterModeSelector> createState() => _FooterModeSelectorState();
}

class _FooterModeSelectorState extends State<FooterModeSelector> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      // tooltip model helps to popup messages when hovering over it.
      message: widget.popupText,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.blue.shade50 : Colors.transparent,
            border: Border.all(
              color: AppColors.searchBarBorder,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 17,
                color: widget.isSelected ? AppColors.cardColor : AppColors.cyan,
              ),
              //SizedBox(width: 6),
              // Text(
              //   label,
              //   style: GoogleFonts.ibmPlexSans(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w500,
              //     color: isSelected ? Colors.blue : Colors.grey.shade700,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
