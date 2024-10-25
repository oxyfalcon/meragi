import 'package:flutter/material.dart';
import 'package:test_app/view/pages/desktop_screen.dart';
import 'package:test_app/view/pages/mobile_screen.dart';
import 'package:test_app/utils/config.dart';
import 'package:test_app/view/pages/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Guild',
      scrollBehavior:
          ScrollConfiguration.of(context).copyWith(scrollbars: false),
      theme: ThemeData(
          fontFamily: "Inter",
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFFA03CEA))),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return Config.instance.prefs.getBool("login") == true
              ? MaterialPageRoute(builder: (context) => const PageScreen())
              : MaterialPageRoute(builder: (context) => const HomePage());
        }
        return null;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1300
        ? const DesktopScreen()
        : const MobileScreen();
  }
}
