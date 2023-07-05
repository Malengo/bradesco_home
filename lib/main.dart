import 'package:bradesco_home/home/domain/provider/favorite_footer.dart';
import 'package:bradesco_home/home/presentation/components/footer_items.dart';
import 'package:bradesco_home/injectors.dart';
import 'package:bradesco_home/side_menu/presentation/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/presentation/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteFooter(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _configApp();
  }

  Future<void> _configApp() async {
    await ReleaseInjector().inject();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(243, 28, 92, 1),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
              iconSize: 25,
            ),
          ],
        ),
        body: const Home(),
      ),
    );
  }
}
