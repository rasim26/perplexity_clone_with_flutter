import 'package:flutter/material.dart';
import 'package:perpelxity_clone/Theme/colors.dart';


class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // allocated in a specified space.
      width: 64,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Icon(
            Icons.auto_awesome_outlined,
            color: AppColors.whiteColor,
            size: 46,
          ),
          const SizedBox(
            height: 34,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            child: Icon(
              Icons.add_circle_outlined,
              color: Color.fromARGB(164, 255, 255, 255),
              size: 36,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.saved_search,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Home',
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sports_basketball,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Discover',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome_motion_outlined,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Spaces',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_pin,
                  color: AppColors.cyan,
                  size: 30,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Sign in',
                  style: TextStyle(color: AppColors.cyan),
                ),
              ],
            ),
          ),
          // Image.asset(
          //   'lib/reference/perplexity-ai-icon.webp',
          //   width: 100,
          //   height: 100,
          // ),
        ],
      ),
    );
  }
}
