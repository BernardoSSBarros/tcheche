// ignore: file_names

import 'package:flutter/material.dart';
//import 'package:teste/ContestacaoEnviar.dart';
//import 'package:teste/Historico.dart';
//import 'package:teste/ProfilePage.dart';
import 'Historico.dart';
import 'ProfilePage.dart';
//import 'package:teste/contestarStrike.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'notification.dart';
// ignore: file_names

import 'PremiumPage.dart';
import 'agenda.dart';

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
    ProfilePage(),
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

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuração')),
      body: Center(child: Text('Página de Configuração')),
    );
  }
}

class EstatisticaPage extends StatelessWidget {
  const EstatisticaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estatística')),
      body: Center(child: Text('Página de Estatística')),
    );
  }
}

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Premium')),
      body: Center(child: Text('Página Premium')),
    );
  }
}

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: Center(child: Text('Página de Favoritos')),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar Perfil')),
      body: Center(child: Text('Página de Perfil')),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _launchUrl(Uri url) async {
    //if (!await launchUrl(url)) {
      //throw Exception('Não foi possível abrir $url');
    //}
  }

  Widget buildLinkButton(String label, Uri url, Color color, String imageAsset) {
    return SizedBox(
      width: 120,
      height: 100,
      child: ElevatedButton(
        onPressed: () => _launchUrl(url),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, width: 32, height: 32),
            SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget buildProfile({required String imageAsset, required String description, required Uri profileUrl}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageAsset),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _launchUrl(profileUrl),
                    child: Text('Ver Perfil'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'label': 'Limpeza doméstica',
        'url': Uri.parse('https://example.com'),
        'color': const Color.fromARGB(255, 26, 182, 209),
        'image': 'assets/broom.png'
      },
      {
        'label': 'Suporte Técnico',
        'url': Uri.parse('https://example.com'),
        'color': const Color.fromARGB(255, 66, 38, 226),
        'image': 'assests/cpu.png'
      },
      {
        'label': 'Pedreiro',
        'url': Uri.parse('https://example.com'),
        'color': const Color.fromARGB(255, 214, 150, 10),
        'image': 'assests/hammer.png'
      },
      {
        'label': 'Manutenção',
        'url': Uri.parse('https://example.com'),
        'color': const Color.fromARGB(255, 198, 218, 23),
        'image': 'assests/settings.png'
      },
      {
        'label': 'Cozinheiro',
        'url': Uri.parse('https://example.com'),
        'color': const Color.fromARGB(255, 201, 29, 29),
        'image': 'assests/chef.png'
      },
      {
        'label': 'Diarista',
        'url': Uri.parse('https://example.com'),
        'color': Colors.tealAccent,
        'image': 'assests/cleaning.png'
      },
    ];

    final List<Map<String, dynamic>> actionButtons = [
      {
        'label': 'Meu Serviço Pendente',
        'url': Uri.parse('https://example.com/service'),
        'image': 'assets/relogio.png'
      },
      {
        'label': 'Agenda',
        'url': Uri.parse('https://example.com/schedule'),
        'image': 'assets/Message.png'
      },
      {
        'label': 'Requisição de Serviço',
        'url': Uri.parse('https://example.com/request'),
        'image': 'assets/mais.png'
      }
    ];

    final Uri _sampleLink = Uri.parse('https://flutter.dev');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton<String>(
              icon: Icon(Icons.settings),
              onSelected: (value) {
                switch (value) {
                  case 'configuracao':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigPage()));
                    break;
                  case 'historico':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricoPage()));
                    break;
                  case 'estatistica':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EstatisticaPage()));
                    break;
                  case 'premium':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPage()));
                    break;
                  case 'favoritos':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritosPage()));
                    break;
                  case 'perfil':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(value: 'configuracao', child: Text('Configuração')),
                PopupMenuItem(value: 'historico', child: Text('Histórico')),
                PopupMenuItem(value: 'estatistica', child: Text('Estatística')),
                PopupMenuItem(value: 'premium', child: Text('Premium')),
                PopupMenuItem(value: 'favoritos', child: Text('Favoritos')),
                PopupMenuItem(value: 'perfil', child: Text('Gerenciar Perfil')),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text('Categorias Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: categories.map((cat) =>
                buildLinkButton(cat['label'], cat['url'], cat['color'], cat['image'])
              ).toList(),
            ),
            SizedBox(height: 32),
            Column(
              children: actionButtons.map((action) => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(action['url']),
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 20)),
                  icon: Image.asset(action['image'], width: 24, height: 24),
                  label: Text(action['label']),
                ),
              )).toList(),
            ),
            SizedBox(height: 32),
            Text('Profissionais em Destaque', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            buildProfile(
              imageAsset: 'assets/pessoa1.png',
              description: 'João Silva - Designer Gráfico',
              profileUrl: _sampleLink,
            ),
            buildProfile(
              imageAsset: 'assets/pessoa2.png',
              description: 'Carlos Souza - Desenvolvedor Mobile',
              profileUrl: _sampleLink,
            )
          ],
        ),
      ),
    );
  }
}
