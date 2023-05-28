import 'package:flutter/cupertino.dart';

class SearchAppBarController {
  final ValueNotifier<bool> isOpen;

  SearchAppBarController([bool isSearchOpen = false]) : isOpen = ValueNotifier(isSearchOpen);
}
