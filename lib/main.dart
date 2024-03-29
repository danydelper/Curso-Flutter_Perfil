import 'package:flutter/material.dart';
import 'package:perfil/app/modules/cadastro/cadastro.dart';
import 'package:perfil/app/modules/perfil/perfilController.dart';
import 'package:perfil/app/modules/home/home.dart';
import 'package:perfil/app/modules/perfil/perfil.dart';
import 'package:perfil/app/components/theme_data.dart';
import 'package:perfil/user/userMode.dart';

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
          final user = setting.arguments as User?;
          return MaterialPageRoute(
            builder: (ctx) => CadastroView(user: user),
          );
        }
      },
      routes: {
        "/home": (ctx) => HomeView(),
        "/perfil": (ctx) => const MyHomePage(),
      },
      initialRoute: '/home',
//      home: const MyHomePage(),
    );
  }
}
