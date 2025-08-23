import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({ super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
      ),
      backgroundColor: isDark ? const Color(0xFF212121) : Theme.of(context).primaryColor,
      elevation: 4,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}