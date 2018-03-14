import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppState extends InheritedWidget {

  final int counter;

  AppState({
    Key key,
    @required this.counter,
    @required Widget child}) : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppState);
  }

  @override
  bool updateShouldNotify(AppState old) =>
      counter != old.counter;
}
