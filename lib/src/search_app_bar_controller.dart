import 'package:flutter/cupertino.dart';

class SearchAppBarController {
  final ValueNotifier<bool> isOpen;

  SearchAppBarController([bool isSearchOpen = false]) : isOpen = ValueNotifier(isSearchOpen);

  void toggleOpen([bool? isOpen]) => this.isOpen.value = isOpen ?? !this.isOpen.value;
}
