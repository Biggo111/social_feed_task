import 'package:flutter/material.dart';

class NavigationService{

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  Future<dynamic> navigateTo(Route route) {
    return navigatorKey.currentState!.push(route);
  }

}