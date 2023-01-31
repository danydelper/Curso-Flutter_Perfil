import 'package:flutter/material.dart';
import 'package:perfil/list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (darkMode) ? Colors.black : Colors.white,
      drawer: Drawer(
        child: ListView(
          children: ListMenu.get(context),
        ),
      ),
      appBar: AppBar(
        backgroundColor: (darkMode) ? Colors.white70 : Colors.black,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              child: ClipOval(
                child: Image.network(
                  "https://github.com/treinaweb.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              'Perfil',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.miscellaneous_services,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: 200,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        child: ClipOval(
                          child: Image.network(
                              "https://github.com/danydelper.png"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Container(
                            color: Colors.blue,
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  card(
                      title: 'Daniel Peres',
                      subtitle: "daniel@delper.com.br",
                      vdarkMode: darkMode),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    color: (darkMode) ? Colors.white : Colors.black,
                  ),
                ),
                children: [
                  TableRow(
                    children: [
                      card(
                          title: '27',
                          subtitle: 'Projetos',
                          vdarkMode: darkMode),
                      card(
                          title: '259', subtitle: 'Tasks', vdarkMode: darkMode),
                      card(
                          title: '35', subtitle: 'Groups', vdarkMode: darkMode),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: (darkMode) ? Colors.white : Colors.black,
              height: 10,
            ),
            listTile(icon: Icons.work, title: 'Workspace', vdarkMode: darkMode),
            listTile(
                icon: Icons.person, title: 'Edit Profile', vdarkMode: darkMode),
            listTile(
                icon: Icons.notifications,
                title: 'Notifications',
                vdarkMode: darkMode),
            listTile(
                icon: Icons.security, title: 'Secutiry', vdarkMode: darkMode),
            SwitchListTile(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
              secondary: Icon(
                Icons.dark_mode,
                color: (darkMode) ? Colors.white : Colors.black,
              ),
              title: Text(
                'DarkTeme',
                style: TextStyle(
                  color: (darkMode) ? Colors.white : Colors.black,
                ),
              ),
              activeColor: Colors.white,
              inactiveThumbColor: Colors.white,
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.red,
            ),
            GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Tem certeza que deseja SAIR ?'),
                      action: SnackBarAction(
                          label: 'Sair',
                          onPressed: () {},
                          textColor: Colors.red[300]),
                    ),
                  );
                },
                child: listTile(
                    icon: Icons.logout, title: 'Logout', vdarkMode: darkMode)),
          ],
        ),
      ),
    );
  }
}

Widget listTile(
    {required IconData icon, required String title, required bool vdarkMode}) {
  return ListTile(
    iconColor: (vdarkMode) ? Colors.white : Colors.black,
    textColor: (vdarkMode) ? Colors.white : Colors.black,
    leading: Icon(icon),
    title: Text(title),
  );
}

Widget card(
    {required String title,
    required String subtitle,
    required bool vdarkMode}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: (vdarkMode) ? Colors.white : Colors.black,
              fontSize: 20),
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          color: (vdarkMode) ? Colors.white : Colors.black,
        ),
      ),
    ],
  );
}

//parei em 13:14