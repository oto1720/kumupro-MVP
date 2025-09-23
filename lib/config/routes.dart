import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kumupro_mvp/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);