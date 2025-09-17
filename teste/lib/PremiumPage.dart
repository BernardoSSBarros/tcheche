// ignore: file_names
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
 
  Widget buildLinkButton(List<String> texts, Color color) {
    return SizedBox(
      width: 360,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: texts.asMap().entries.map((entry) {
            int idx = entry.key;
            String text = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: idx == 0
                    ? TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                    : TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'texts': [
          'Plano Essencial (Gratuito)',
          'Criação de perfil profissional',
          'Portifolio limitado',
          'Taxa de serviço',
          'Visibilidade limitada na busca',
          'Portifólio com até 5 fotos'
        ],
        'color': const Color.fromARGB(156, 255, 44, 44),
      },
      {
        'texts': [
          'Plano Profissional',
          'Inclui tudo do plano essencial +',
          'Destaque nos resultados de busca',
          'Acesso a estatísticas do perfil',
          'Tempo médio de resposta exibido',
          'Selo de profissional verificado',
          'Diminuição da taxa de serviço',
          'Portifólio com até 20 fotos'
        ],
        'color': const Color.fromARGB(255, 74, 158, 255),
      },
      {
        'texts': [
          'Plano Elite',
          'Inclui tudo do Profissional +',
          'Selo de "Destaque da Semana"',
          'Agendamento automático de clientes',
          'Anúncios promovidos dentro do app',
          'Consultoria mensal com especialista',
          'Exportação de dados e histórico',
          'Acesso antecipado a novas ferramentas'
        ],
        'color': Color.fromRGBO(247, 127, 0, 1),
      }
    ];
 
    final List<Map<String, dynamic>> actionButtons = [
      {
        'label': 'Experimente Grátis o Premium',
        'url': Uri.parse('https://contato.example.com')
      },
      {
        'label': 'Assinar um dos planos',
        'url': Uri.parse('https://suporte.example.com')
      },
    ];
 
    final List<Color> buttonColors = [
      Color.fromARGB(255, 74, 158, 255),
      Color.fromARGB(255, 247, 127, 0),
    ];
 
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
            Text('Planos disponíveis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: categories
                  .map((cat) =>
                      buildLinkButton(cat['texts'] as List<String>, cat['color'] as Color))
                  .toList(),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actionButtons.asMap().entries.map((entry) {
                int idx = entry.key;
                Map<String, dynamic> btn = entry.value;
                return Container(
                  width: 160,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () => _launchUrl(btn['url'] as Uri),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColors[idx],
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      btn['label'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
 