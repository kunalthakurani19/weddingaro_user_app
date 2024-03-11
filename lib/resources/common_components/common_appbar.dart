import 'package:flutter/material.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/img_res.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget?>? actions;
  final bool? isNotDrawer;

  const CommonAppBar({
    Key? key,
    this.title,
    this.actions = const [],
    this.isNotDrawer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title == null ? Image.asset(ImageRes.redWALogoPng) : WaText(title),
          isNotDrawer == false
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // Open the drawer using the new context
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
              : Container(),
        ],
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
