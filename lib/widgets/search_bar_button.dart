
import 'package:flutter/material.dart';
import 'package:perpelxity_clone/widgets/footer_mode_selector.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          // IconButton.outlined(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.saved_search_outlined,
          //     color: AppColors.cyan,
          //     size: 20,
          //   ),
          // ),
          // IconButton.outlined(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.analytics_outlined,
          //     color: AppColors.cyan,
          //     size: 20,
          //   ),
          // ),
          // IconButton.outlined(
          //   style: ButtonStyle(),
          //   padding: EdgeInsets.all(10),
          //   highlightColor: AppColors.iconGrey,
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.lightbulb_outline,
          //     color: AppColors.cyan,
          //     size: 20,
          //   ),
          // ),
          const SizedBox(
            width: 4,
          ),
          FooterModeSelector(
            icon: Icons.saved_search,
            isSelected: false,
            popupText: 'Search : Fast answers to everyday Questions',
            onTap: () {},
          ),
          const SizedBox(
            width: 4,
          ),
          FooterModeSelector(
            icon: Icons.analytics_outlined,
            isSelected: false,
            popupText: 'Research : Deep research on any topic',
            onTap: () {},
          ),
          const SizedBox(
            width: 4,
          ),
          FooterModeSelector(
            icon: Icons.lightbulb_outline_rounded,
            isSelected: false,
            popupText: 'Labs : Create projects from scratch',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
