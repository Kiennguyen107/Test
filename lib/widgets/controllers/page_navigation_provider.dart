import 'package:flutter/material.dart';

class PageNavigationProvider extends InheritedWidget {
  final PageController controller;
  final Function(int) navigateToPage;

  PageNavigationProvider({
    Key? key,
    required this.controller,
    required this.navigateToPage,
    required Widget child,
  }) : super(key: key, child: child);

  static PageNavigationProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageNavigationProvider>();
  }

  @override
  bool updateShouldNotify(PageNavigationProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}
