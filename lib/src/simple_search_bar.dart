import 'package:flutter/material.dart';

import 'search_app_bar_controller.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? statusBarColor;
  final Color? primary;
  final AppBar mainAppBar;
  final Color? mainTextColor;
  final String searchHint;
  final SearchAppBarController appBarController;
  final Function(String search) onChange;
  final Function(String search)? onSubmit;
  final double searchFontSize;

  SearchAppBar({
    this.primary,
    this.mainTextColor,
    this.statusBarColor,
    this.searchHint = "Search here...",
    required this.mainAppBar,
    required this.appBarController,
    required this.onChange,
    this.onSubmit,
    this.searchFontSize = 20,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: appBarController.isOpen,
      builder: (context, isOpen, child) {
        return isOpen ? searchAppBar(context: context) : showMainAppBar();
      },
    );
  }

  Widget showMainAppBar() => mainAppBar;

  Widget searchAppBar({required BuildContext context}) {
    return AppBar(
      leading: InkWell(
        child: Icon(
          Icons.close,
          color: mainTextColor,
        ),
        onTap: () {
          appBarController.isOpen.value = false;
          onChange('');
          onSubmit?.call('');
        },
      ),
      backgroundColor: primary,
      title: Container(
        child: TextField(
          autofocus: true,
          onChanged: onChange,
          onSubmitted: onSubmit,
          style: TextStyle(
            fontSize: searchFontSize,
            color: mainTextColor,
          ),
          cursorColor: mainTextColor,
          decoration: InputDecoration(
            hintText: searchHint,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: mainTextColor?.withAlpha(100),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: mainTextColor?.withAlpha(100),
            ),
          ),
        ),
      ),
    );
  }
}
