import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ToolBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight /*+ kTextTabBarHeight + dividerHeight*/);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
    );
  }
}
