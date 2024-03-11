import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';

import '../color.dart';

class ExpandableComponent extends StatelessWidget {
  final String title;
  final Widget expandedWidget;

  const ExpandableComponent({super.key, required this.title, required this.expandedWidget});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          color: AppColors.veryLightRed.withOpacity(0.1),
        ),
        child: ScrollOnExpand(
          child: ExpandablePanel(
            collapsed: Container(),
            expanded: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: expandedWidget,
              ),
            ),
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: WaText(
                title,
                fontsize: 14,
              ),
            ),
            builder: (context, collapsed, expanded) => Expandable(collapsed: collapsed, expanded: expanded),
          ),
        ),
      ),
    );
  }
}
