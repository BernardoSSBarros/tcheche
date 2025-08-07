
import 'package:flutter/material.dart';
import 'package:teste/perfila.dart';
import 'package:teste/contestacaoEnviar.dart';
import 'package:teste/contestarStrike.dart';
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

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notificações')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NotificationCard(
            title: 'Serviço Concluído',
            profileName: 'Ana Clara',
            service: 'Manutenção Elétrica',
            date: '07/06/2025',
            time: '14:30',
            rating: 4.5,
            onDetailsPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilAPage()),
              );
            },
          ),
          SizedBox(height: 20),
          NotificationCard(
            title: 'Strike',
            profileName: 'Joana Silva',
            service: 'Limpeza Residencial',
            date: '08/06/2025',
            time: '09:00',
            rating: 2.0,
            onDetailsPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContestarStrikePage()),
              );
            },
            showContestar: true,
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String profileName;
  final String service;
  final String date;
  final String time;
  final double rating;
  final VoidCallback onDetailsPressed;
  final bool showContestar;

  const NotificationCard({
    required this.title,
    required this.profileName,
    required this.service,
    required this.date,
    required this.time,
    required this.rating,
    required this.onDetailsPressed,
    this.showContestar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Referente a: $service'),
                    Text('Data: $date'),
                    Text('Hora: $time'),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: onDetailsPressed,
                          child: Text('Ver Detalhes'),
                        ),
                        if (showContestar)
                          SizedBox(width: 8),
                        if (showContestar)
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ContestacaoEnviarPage()),
                              );
                            },
                            child: Text('Contestar Strike'),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('Avaliação', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.star, color: Colors.amber),
                  Text(rating.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

