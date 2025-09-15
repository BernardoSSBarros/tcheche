import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cepController = TextEditingController();

  String userType = 'comum';
  List<String> workerTags = [];
  final allTags = ['Marceneiro', 'Encanador', 'Eletricista'];

  bool isCpfValid(String cpf) => RegExp(r'^\d{11}$').hasMatch(cpf);
  bool isCepValid(String cep) => RegExp(r'^\d{5}-?\d{3}$').hasMatch(cep);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: userType,
              items: const [
                DropdownMenuItem(value: 'comum', child: Text('Usuário Comum')),
                DropdownMenuItem(value: 'trabalhador', child: Text('Trabalhador')),
              ],
              onChanged: (val) => setState(() => userType = val!),
            ),
            if (userType == 'trabalhador') ...[
              TextField(controller: _cpfController, decoration: const InputDecoration(labelText: 'CPF')),
              TextField(controller: _cepController, decoration: const InputDecoration(labelText: 'CEP')),
              Wrap(
                spacing: 8,
                children: allTags.map((tag) {
                  final selected = workerTags.contains(tag);
                  return FilterChip(
                    label: Text(tag),
                    selected: selected,
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          workerTags.add(tag);
                        } else {
                          workerTags.remove(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (userType == 'trabalhador') {
                    if (!isCpfValid(_cpfController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('CPF inválido')));
                      return;
                    }
                    if (!isCepValid(_cepController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('CEP inválido')));
                      return;
                    }
                  }

                  await _auth.register(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userType: userType,
                    cpf: _cpfController.text,
                    cep: _cepController.text,
                    tags: workerTags,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado com sucesso!')));
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro: $e')));
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
