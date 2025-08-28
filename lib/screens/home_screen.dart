import 'package:flutter/material.dart';
import 'package:perpelxity_clone/widgets/search_section.dart';
import 'package:perpelxity_clone/widgets/side_nav_bar.dart';

import '../widgets/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //side navigation bar, there should be a perplexity logo on top on_click, -> home_page
          const SideNavBar(),
          Expanded(
            //after using expanded, the content within
            //them takes the entire width on the screen (if column)
            //if its row,  takes the entire height on the screen
            child: Column(
              children: [
                // search section
                const Expanded(child: SearchSection()),
                Container(
                  height: 20,
                )
                // footer (vertically layed out)
              ],
            ),
          )
        ],
      ),
    );
  }
}
