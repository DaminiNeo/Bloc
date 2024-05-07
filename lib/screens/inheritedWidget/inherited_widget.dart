import 'package:flutter/material.dart';

class UserDataInheritedWidget extends InheritedWidget {
  const UserDataInheritedWidget({
    super.key,
    required super.child,
    required this.userName,
  });

  final String userName;

  static UserDataInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserDataInheritedWidget>();
  }

  @override
  bool updateShouldNotify(UserDataInheritedWidget oldWidget) {
    return oldWidget.userName != userName;
  }
}
