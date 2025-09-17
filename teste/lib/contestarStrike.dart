import 'package:flutter/material.dart';
//import 'package:teste/contestacaoEnviar.dart';
import 'notification.dart';
import 'ContestacaoEnviar.dart';
import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Links',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
        ],
      ),
    );
  }
}


class ContestarStrikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Strike', style: TextStyle(color: Colors.red))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(height: 20),
                Text('Denunciante', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Joana Silva', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text('Profissional', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Carlos Souza', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text('Serviço', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Limpeza Residencial', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text('Data: 08/06/2025', style: TextStyle(fontSize: 14)),
                Text('Hora: 09:00', style: TextStyle(fontSize: 14)),
                Text('Local: Rua das Flores, 123', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 16),
                Text('Motivo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  'O profissional não compareceu ao serviço agendado sem aviso prévio, causando transtornos ao cliente.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      child: Text('Ver Menos'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContestacaoEnviarPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                      child: Text('Contestar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



