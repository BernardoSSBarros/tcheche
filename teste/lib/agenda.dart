import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'Home.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premium',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatelessWidget {
  Future<void> _launchUrl(Uri url) async {
     {
      throw Exception('Não foi possível abrir $url');
    }
  }
 
  Widget buildInfoBox({
    required List<String> texts,
    required String buttonLabel,
    required Uri buttonUrl,
  }) {
    return Container(
      width: 360,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: Row(
        children: [
          // Left side - Button
          Container(
            margin: EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () => _launchUrl(buttonUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                buttonLabel,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
 
          // Right side - Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: texts.asMap().entries.map((entry) {
                int idx = entry.key;
                String text = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: idx == 0 ? 18 : 14,
                      fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'texts': ['Período de Serviço', '8:00 - 13:30'],
        'buttonLabel': 'Adicionar\nPeríodo',
        'buttonUrl': Uri.parse('https://contato.example.com'),
      },
      {
        'texts': [
          'Período de Serviço',
          '8:00 - 13:30',
          'Descrição: Consertar furos de paredes'
        ],
        'buttonLabel': 'Adicionar\nCompromisso',
        'buttonUrl': Uri.parse('https://suporte.example.com'),
      },
    ];
 
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text('Agenda', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            buildInfoBox(
              texts: categories[0]['texts'],
              buttonLabel: categories[0]['buttonLabel'],
              buttonUrl: categories[0]['buttonUrl'],
            ),
            SizedBox(height: 24),
            Text('Segunda', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            buildInfoBox(
              texts: categories[1]['texts'],
              buttonLabel: categories[1]['buttonLabel'],
              buttonUrl: categories[1]['buttonUrl'],
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
 