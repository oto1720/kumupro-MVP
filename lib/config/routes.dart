import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kumupro_mvp/screens/home_screen.dart';
import 'package:kumupro_mvp/screens/game_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/game/:stageId',
      builder: (context, state) {
        final stageId = state.pathParameters['stageId']!;
        return GameScreen(stageId: stageId);
      },
    ),
    GoRoute(
      path: '/camera/:stageId',
      builder: (context, state) {
        final stageId = state.pathParameters['stageId']!;
        return Scaffold(
          appBar: AppBar(title: Text('Camera: $stageId')),
          body: const Center(child: Text('Camera Screen - Coming Soon')),
        );
      },
    ),
  ],
);