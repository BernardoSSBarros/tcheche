import 'package:flutter/material.dart';
//import 'package:teste/PerfilG.dart';
//import 'package:teste/PerfilJ.dart';
import 'Home.dart';
import 'notification.dart';
import 'PerfilJ.dart';
import 'PerfilG.dart';

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
    HistoricoPage(),
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

class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NotificationCard(
            title: 'Construção de Muro',
            profileName: 'João Miguel',
            local: 'Rua das Acácias, 89',
            date: '11/06/2025',
            time: '14:30',
            rating: 4.5,
            onDetailsPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilJPage()),
              );
            },
          ),
          SizedBox(height: 20),
          NotificationCard(
            title: 'Troca de Piso',
            profileName: 'Gabriela Castro',
            local: 'Rua das Águas claras, 29',
            date: '08/06/2025',
            time: '09:00',
            rating: 4.0,
            onDetailsPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilGPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String profileName;
  final String local;
  final String date;
  final String time;
  final double rating;
  final VoidCallback onDetailsPressed;


  const NotificationCard({
    required this.title,
    required this.profileName,
    required this.local,
    required this.date,
    required this.time,
    required this.rating,
    required this.onDetailsPressed,

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
                    Text('Local: $local'),
                    Text('Data: $date'),
                    Text('Hora: $time'),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: onDetailsPressed,
                          child: Text('Ver Detalhes'),
                        ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Placeholder()),
                              );
                            },
                            child: Text('Recontratar'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('Concluido', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
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