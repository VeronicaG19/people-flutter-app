import 'package:flutter/material.dart';

class CustomRouter {
  final BuildContext _context;

  CustomRouter._internal(this._context);

  factory CustomRouter.of(BuildContext context) =>
      CustomRouter._internal(context);

  Future<void> push(Widget page) =>
      Navigator.of(_context).push(_pageBuilder(page));

  Future<void> replace(Widget page) =>
      Navigator.of(_context).pushReplacement(_pageBuilder(page));

  Future<void> pushAndRemoveAll(Widget page) => Navigator.of(_context)
      .pushAndRemoveUntil(_pageBuilder(page), (_) => false);

  void pop() => Navigator.of(_context).pop();

  PageRouteBuilder<Object> _pageBuilder(Widget page) {
    return PageRouteBuilder(
      transitionsBuilder: _transitionBuilder,
      pageBuilder: (_, __, ___) => page,
    );
  }

  Widget _transitionBuilder(context, animation, _, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
}
