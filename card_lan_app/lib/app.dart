import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'state/providers/connection_provider.dart';
import 'state/providers/game_state_provider.dart';
import 'state/providers/ruleset_provider.dart';
import 'ui/screens/home/home_screen.dart';

class CardLanApp extends StatelessWidget {
  const CardLanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectionProvider()),
        ChangeNotifierProvider(create: (_) => GameStateProvider()),
        ChangeNotifierProvider(create: (_) => RulesetProvider()),
      ],
      child: MaterialApp(
        title: 'Card LAN',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
