import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acessibilidade App',
      theme: ThemeData(
        // Use ColorScheme.fromSeed for modern Material 3 theming
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Opt-in to Material 3 design
      ),
      home: const AcessibilidadePage(),
    );
  }
}

class AcessibilidadePage extends StatelessWidget {
  const AcessibilidadePage({super.key});

  static String routeName = 'acessibilidade';
  static String routePath = '/acessibilidade';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB8DDFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            // Check if there's a route to pop before attempting to pop
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Acessibilidade',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        toolbarHeight: 56,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: const [
                _AcessibilidadeItem(title: 'Leitura em voz alta'),
                _AcessibilidadeItem(title: 'Reduzir Efeitos'),
                _AcessibilidadeItem(title: 'Ajuste de cores'),
                _AcessibilidadeItem(title: 'Tamanho da interface'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _AcessibilidadeButton(
                    text: 'Manter alterações',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Alterações mantidas!')),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _AcessibilidadeButton(
                    text: 'Voltar padrão',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Configurações resetadas para o padrão!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _AcessibilidadeItem extends StatelessWidget {
  final String title;
  const _AcessibilidadeItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: Colors.grey,
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }
}

class _AcessibilidadeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _AcessibilidadeButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFFE0E0E0),
        side: const BorderSide(color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}