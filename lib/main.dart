import 'package:flutter/material.dart';
import 'package:perfil/cadastro.dart';
import 'package:perfil/controller.dart';
import 'package:perfil/home.dart';
import 'package:perfil/index.dart';
import 'package:perfil/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    PerfilController.isDark.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      debugShowCheckedModeBanner: false,
      theme: ThemeDataPerfil.getLight(),
      darkTheme: ThemeDataPerfil.getDart(),
      themeMode: PerfilController.isDark.value,
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == '/cadastro') {
          return MaterialPageRoute(
            builder: (ctx) => CadastroView(),
          );
        }
        return null;
      },
      routes: {
        "/home": (ctx) => const HomeView(),
        "/perfil": (ctx) => const MyHomePage(),
      },
      initialRoute: '/home',
//      home: const MyHomePage(),
    );
  }
}
