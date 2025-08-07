// ignore: file_names
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Nota: Adicione o código para a navegação de voltar aqui
           Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho com foto de perfil e logo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 50, color: Colors.blueGrey),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Image.asset(
                      'assets/montserrat_logo.png', // Substitua pelo caminho do logo
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Informações do profissional
              Text(
                'Carpinteiro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Carapicuíba, São Paulo',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),
              Text(
                'Sobre mim:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Possuo mais de 10 anos de experiência na area',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),

              // Botões de ação
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildActionButton(
                      'Portifólio', () {}, Colors.blue[900]!),
                  _buildActionButton(
                      'Comentários', () {}, Colors.blue[900]!),
                  _buildActionButton(
                      'Agenda', () {}, Colors.blue[900]!),
                  _buildActionButton(
                      'Conversar', () {}, Colors.blue[900]!),
                ],
              ),
              SizedBox(height: 32),

              // Seção de Análise
              Row(
                children: [
                  Text('Análise',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.bar_chart, color: Colors.grey[700]),
                ],
              ),
              SizedBox(height: 16),

              // Itens de análise
              _buildAnalysisItem(
                icon: Icons.group,
                title: '12 Visualizações no seu perfil',
                subtitle: 'Faça modificações no seu perfil para atrair mais clientes',
              ),
              _buildAnalysisItem(
                icon: Icons.mail_outline,
                title: '5 Clientes entraram em contato',
                subtitle: 'Procure dar uma experiência personalizada para seus clientes',
              ),
              _buildAnalysisItem(
                icon: Icons.calendar_today,
                title: '4 Serviços realizados',
                subtitle: 'Total de serviços realizados em todo o período',
              ),
              _buildAnalysisItem(
                icon: Icons.star,
                title: '4.3 Nota Média',
                subtitle: 'Média com base em todas as avaliações',
              ),
              _buildAnalysisItem(
                icon: Icons.access_time,
                title: '2:30 Tempo de resposta médio',
                subtitle: 'Quanto tempo leva para responder',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed, Color color) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildAnalysisItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.blueGrey),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}