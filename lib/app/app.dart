import 'package:app_financas/ui/pages/home_page.dart';
import 'package:app_financas/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class AppFinacas extends StatelessWidget {
  const AppFinacas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Controle de Finanças',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: themeData(),
    );
  }
}
